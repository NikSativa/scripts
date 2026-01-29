#!/bin/bash

set -uo pipefail

silent=false
for arg in "$@"; do
  if [[ "$arg" == "--silent" ]]; then
    silent=true
  fi
done

# Add swiftformat to PATH
export PATH=/usr/local/bin:/opt/homebrew/bin:$PATH

# Resolve script directory to absolute path (works when invoked from any cwd)
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Project root: current directory, or two levels up if inside .swiftpm/xcode
src_root_path=${PWD}
if [[ "$src_root_path" == *".swiftpm/xcode"* ]]; then
  src_root_path=$(cd "$src_root_path/../.." && pwd)
fi

# Check for swiftformat (command -v is POSIX, preferred over deprecated which)
if ! command -v swiftformat &>/dev/null; then
  if [[ "$silent" == false ]]; then
    osascript -e 'display notification "Installing SwiftFormat…" with title "Format Files"'
  fi
  brew install swiftformat
fi

if command -v swiftformat &>/dev/null; then
  swiftformat_config="$src_root_path/.swiftformat"
  if [[ -f "$swiftformat_config" ]]; then
    swiftformat --config "$swiftformat_config" "$src_root_path"
  else
    cp "$script_dir/default.swiftformat" "$swiftformat_config"
    swiftformat --config "$swiftformat_config" "$src_root_path"
    rm -f "$swiftformat_config"
  fi
else
  if [[ "$silent" == false ]]; then
    osascript -e 'display notification "SwiftFormat not found. Run: brew install swiftformat" with title "Format Files"'
  fi
  exit 1
fi

if [[ "$silent" == false ]]; then
  osascript -e 'display notification "Files formatted" with title "Format Files"'
fi

exit 0
