#!/bin/bash

script_full_path=$(dirname "$0")

echo "====> killing Xcode"
killall Xcode
sleep 1

sh $script_full_path/swiftpm_global.sh
sh $script_full_path/swiftpm_local.sh

sh $script_full_path/xc_rm_cache_global.sh
sh $script_full_path/xc_rm_cache_local.sh
