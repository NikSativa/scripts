#!/bin/sh

script_full_path=$(dirname "$0")
sh $script_full_path/../bundle/bundle.sh exec pod outdated $@
