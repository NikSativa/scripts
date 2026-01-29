#!/bin/bash

set -uo pipefail

silent=false
for arg in "$@"; do
  if [[ "$arg" == "--silent" ]]; then
    silent=true
  fi
done

# Add tools to PATH
export PATH=/usr/local/bin:/opt/homebrew/bin:$PATH

# Resolve script directory to absolute path (works when invoked from any cwd)
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Project root: current directory, or two levels up if inside .swiftpm/xcode
src_root_path=${PWD}
if [[ "$src_root_path" == *".swiftpm/xcode"* ]]; then
  src_root_path=$(cd "$src_root_path/../.." && pwd)
fi

shell_sort_path="$script_dir/sort_Xcode_project_file"
if [[ ! -f "$shell_sort_path" ]]; then
  bash "$script_dir/download_sort_Xcode_project_file.sh"
fi

# Collect .xcodeproj paths: find in tree + projects from .xcworkspace (including groups / folder refs in navigator)
# group: path in workspace is relative to the directory containing the .xcworkspace
declare -A seen_projects
while IFS= read -r -d '' project_path; do
  seen_projects["$project_path"]=1
done < <(find "$src_root_path" -name "*.xcodeproj" -print0)

while IFS= read -r -d '' ws_path; do
  ws_dir=$(dirname "$ws_path")
  ws_parent=$(dirname "$ws_dir")
  data_file="$ws_dir/contents.xcworkspacedata"
  if [[ -f "$data_file" ]]; then
    while IFS= read -r -u 3 ref; do
      path_value="${ref#*location=\"}"; path_value="${path_value%%\"*}"
      if [[ "$path_value" == group:* ]]; then
        rel_path="${path_value#group:}"
        abs_path=$(cd "$ws_parent" && cd "$(dirname "$rel_path")" 2>/dev/null && pwd)/$(basename "$rel_path")
        [[ -d "$abs_path" ]] && seen_projects["$abs_path"]=1
      elif [[ "$path_value" == self:* ]]; then
        abs_path="$ws_parent/${path_value#self:}"
        [[ -d "$abs_path" ]] && seen_projects["$abs_path"]=1
      fi
    done 3< <(grep -oE 'location="[^"]*\.xcodeproj[^"]*"' "$data_file" 2>/dev/null || true)
  fi
done < <(find "$src_root_path" -name "*.xcworkspace" -print0)

for project_path in "${!seen_projects[@]}"; do
  if [[ -f "$shell_sort_path" ]]; then
    perl "$shell_sort_path" -w "$project_path"
  else
    if [[ "$silent" == false ]]; then
      osascript -e 'display notification "Run download_sort_Xcode_project_file.sh to install sorter" with title "Format Xcode Project"'
    fi
    exit 1
  fi
done

if [[ "$silent" == false ]]; then
  osascript -e 'display notification "Xcode project sorted" with title "Format Xcode Project"'
fi

exit 0
