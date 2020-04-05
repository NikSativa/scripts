#!/bin/bash

script_full_path=$(dirname "$0")

sh $script_full_path/DSStore.sh
sh $script_full_path/derivedData.sh
sh $script_full_path/Pods.sh

echo "Removing 'Gemfile.lock' file"
rm -rf ./Gemfile.lock

echo "Removing 'Podfile.lock' file"
rm -rf ./Podfile.lock
