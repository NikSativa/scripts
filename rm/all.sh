#!/bin/bash

script_full_path=$(dirname "$0")

removeLocks=false

for i in "$@"
do
    case $i in
    	-rl|-removeLocks)
			removeLocks=false
		;;

		+rl|+removeLocks)
			removeLocks=true
		;;
    esac
done

sh $script_full_path/DSStore.sh
sh $script_full_path/derivedData.sh
sh $script_full_path/Pods.sh

if $removeLocks; then
	echo "Removing 'Gemfile.lock' file"
	rm -rf ./Gemfile.lock

	echo "Removing 'Podfile.lock' file"
	rm -rf ./Podfile.lock
fi
