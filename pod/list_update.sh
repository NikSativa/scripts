#!/bin/sh
source $(dirname "$0")/../colors.sh

for i in "$@"
do
	if [ ! -z $i ]
	then
		echo "${MAGENTA}pod update ${i} ${NORMAL}"
		[ -d "./.bin" ] && ./.bin/pod update $i || pod update $i
	fi
done
