#!/bin/bash

# add swiftlint swiftformat to PATH
export PATH=/usr/local/bin:$PATH

script_full_path=$(dirname "$0")
src_root_path=$(PWD)

echo "====> killing Xcode"
killall Xcode
sleep 1

synx -p $src_root_path/*.xcodeproj

echo "====> open Xcode"
xed .

osascript -e "display notification \"project synx-ed\""
exit 0
