#!/bin/sh

script_full_path=$(dirname "$0")

echo "====> killing Xcode"
killall Xcode
sleep 1

echo "====> removing All"
sh $script_full_path/rm/all.sh $@

echo "====> installing bundle"
sh $script_full_path/bundle/install.sh

echo "====> installing pods"
sh $script_full_path/pod/install.sh

echo "====> opening Xcode"
sleep 1
xed .

say jobs done
