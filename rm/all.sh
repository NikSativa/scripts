#!/bin/bash

script_full_path=$(dirname "$0")

sh $script_full_path/rm/DSStore.sh
sh $script_full_path/rm/derivedData.sh

echo "Removing 'Gemfile.lock' file"
rm -rf ./Gemfile.lock

echo "Removing 'Podfile.lock' file"
rm -rf ./Podfile.lock

echo "Removing 'Pods' folder"
sh $script_full_path/rm/Pods.sh
