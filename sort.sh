#!/bin/sh

source $(dirname "$0")/colors.sh
script_full_path=$(dirname "$0")

echo "====> killing Xcode"
killall Xcode
sleep 1

sh $script_full_path/synx.sh +p
sh $script_full_path/xunique.sh

say sorting completed
