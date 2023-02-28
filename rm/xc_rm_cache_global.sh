#!/bin/bash

script_full_path=$(dirname "$0")

echo "====> killing Xcode"
killall Xcode
sleep 1

echo "Removing 'swiftpm' folder inside the Library folder"
sh $script_full_path/swiftpm_global.sh

echo "Removing 'DerivedData' folder inside the Library folder"
rm -rf ~/Library/Developer/Xcode/DerivedData
sleep 0.1
