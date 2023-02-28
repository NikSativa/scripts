#!/bin/bash

script_full_path=$(dirname "$0")

sleep 0.1
echo "Removing 'Build' folder inside the Project folder"
rm -rf ./Build
sleep 0.1

echo "Removing 'DSStore' folder inside the Project folder"
sh $script_full_path/DSStore.sh
echo "Removing 'DerivedData' folder inside the Project folder"
sh $script_full_path/derivedData.sh
echo "Removing 'swiftpm' folder inside the Project folder"
sh $script_full_path/swiftpm_local.sh
