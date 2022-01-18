#!/bin/sh

source $(dirname "$0")/colors.sh
script_full_path=$(dirname "$0")

prune=""

for i in "$@"; do
	case $i in
	    -p|-prune)
			prune=""
	    ;;
	    +p|+prune)
			prune=" -p"
		;;
	esac
done

for f in $(find . -name "*.xcodeproj" \
					-not -path "**/**/**"); do
	case $(basename $f) in
		Pods.xcodeproj|Sample.xcodeproj|dummy.xcodeproj)
		# echo "skipping ${f}"
		continue
	esac

	PARAMS="--no-sort-by-name -q${prune} ${f}"
	echo "${GREEN}synx ${PARAMS}${NORMAL}"
	sh $script_full_path/bundle/bundle.sh exec synx ${PARAMS}
done
