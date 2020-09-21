#!/bin/sh

source $(dirname "$0")/../colors.sh
script_full_path=$(dirname "$0")

for i in "$@"
do
	if [ ! -z $i ]
	then
		echo "${MAGENTA}pod update ${i} ${NORMAL}"
		sh $script_full_path/pod.sh update $i
	fi
done
