#!/bin/bash

script_full_path=$(dirname "$0")

sleep 0.1
echo "Removing '.build' folders"
sh $script_full_path/build.sh
sleep 0.1

echo "Removing 'DSStore' folder inside the Project folder"
sh $script_full_path/DSStore.sh

echo "Removing 'DerivedData' folder inside the Project folder"
sh $script_full_path/derivedData.sh

echo "Removing 'swiftpm' folder inside the Project folder"
sh $script_full_path/swiftpm_local.sh
