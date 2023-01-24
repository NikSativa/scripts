#!/bin/bash

# add swiftlint swiftformat to PATH
export PATH=/usr/local/bin:$PATH

script_full_path=$(dirname "$0")
src_root_path=$(PWD)

if [[ $src_root_path == *".swiftpm/xcode"* ]]; then
  src_root_path=$src_root_path/../../
fi

shell_sort_path=$script_full_path/sort_Xcode_project_file
if ! [ -f $shell_sort_path ]; then
  sh $script_full_path/download_sort_Xcode_project_file.sh
fi

for project_path in $(find $src_root_path -name "*.xcodeproj" -not -path "$src_root_path/**/**"); do
  if [ -f $shell_sort_path ]; then
    perl $shell_sort_path -w $project_path
  else
    osascript -e "display notification \"warning: can't find sort_Xcode_project_file, use download_sort_Xcode_project_file.sh\""
    exit 1
  fi
done

osascript -e "display notification \"xpoj sorted\""
exit 0
