#!/bin/bash

script_full_path=$(dirname "$0")

sleep 0.1
echo "Removing 'Build' folder inside the Project folder"
rm -rf ./Build
sleep 0.1

sh $script_full_path/DSStore.sh
sh $script_full_path/derivedData.sh
sh $script_full_path/swiftpm_local.sh

echo "Removing 'DerivedData' folder inside the Library folder"
rm -rf ~/Library/Developer/Xcode/DerivedData
sleep 0.1
