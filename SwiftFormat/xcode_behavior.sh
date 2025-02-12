#!/bin/bash

# git reset --hard
# git status

PATH_TO_SWIFT_FORMAT=$(xcrun --find swift-format)
SCRIPT_FULL_PATH=$(dirname "$0")
SRC_ROOT_PATH=$(PWD)

# SPM support
if [[ $SRC_ROOT_PATH == *".swiftpm/xcode"* ]]; then
  SRC_ROOT_PATH=$SRC_ROOT_PATH/../../
fi

if which $PATH_TO_SWIFT_FORMAT >/dev/null; then
  swiftformat_path="$SRC_ROOT_PATH/.swift-format"
  if [ -f $swiftformat_path ]; then
    $PATH_TO_SWIFT_FORMAT --configuration $swiftformat_path --in-place --recursive --parallel --color-diagnostics $SRC_ROOT_PATH
  else
    $PATH_TO_SWIFT_FORMAT --configuration "$SCRIPT_FULL_PATH/default-swift-format.json" --in-place --recursive --parallel --color-diagnostics $SRC_ROOT_PATH
  fi
else
  osascript -e "display notification \"warning: SwiftFormat not installed, run 'brew install SwiftFormat' or 'arch -x86_64 brew install swiftformat'\""
  exit 1
fi

osascript -e "display notification \"files formated\""
exit 0
