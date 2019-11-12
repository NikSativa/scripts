#!/bin/sh

script_full_path=$(dirname "$0")

dir=.git/hooks/

[ -d $dir ] || mkdir $dir

cp $script_full_path"/pre-commit" $dir"/pre-commit"
