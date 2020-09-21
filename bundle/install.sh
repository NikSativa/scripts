#!/bin/sh

script_full_path=$(dirname "$0")

if [ -f "./.bundle/config" ]; then
	sh $script_full_path/bundle.sh install
else
	sh $script_full_path/bundle.sh install --path='./.bundle'
	sh $script_full_path/bundle.sh binstubs --all --path='./.bundle/bin'
fi
