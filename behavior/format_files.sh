#!/bin/bash

# add swiftlint swiftformat to PATH
export PATH=/usr/local/bin:$PATH

script_full_path=$(dirname "$0")
src_root_path=$(PWD)

if [[ $src_root_path == *".swiftpm/xcode"* ]]; then
  src_root_path=$src_root_path/../../
fi

if ! which swiftformat >/dev/null; then
  brew install swiftformat
fi

if which swiftformat >/dev/null; then
  swiftformat_path="$src_root_path/.swiftformat"
  if [ -f $swiftformat_path ]; then
    swiftformat --config $swiftformat_path $src_root_path
  else
    cp "$script_full_path/default.swiftformat" "$swiftformat_path"
    swiftformat --config "$swiftformat_path" $src_root_path
    rm -rf "$swiftformat_path"
  fi
else
  osascript -e "display notification \"warning: SwiftFormat not installed, run 'brew install SwiftFormat' or 'arch -x86_64 brew install swiftformat'\""
  exit 1
fi

osascript -e "display notification \"files formated\""
exit 0
