#!/bin/sh

script_full_path=$(dirname "$0")
sh $script_full_path/pod.sh cache clean --all
echo "cache cleaned"