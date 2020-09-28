#!/bin/sh

source $(dirname "$0")/colors.sh
script_full_path=$(dirname "$0")

prune=""

for i in "$@"; do
	case $i in
	    -p=*|-prune=*)
	        case "${i#*=}" in
	            1|true|yes)
	                prune=" -p"
	            ;;

	            0|false|no)
	                prune=""
	            ;;
	        esac
	        ;;
	    -p|-prune)
			prune=" -p"
		;;
	esac
done

for f in $(find . -name "*.xcodeproj" \
					-not -path "**/.bundle/**" \
					-not -path "**/Pods/**" \
					-not -path "**/.bin/**" \
					-not -path "**/Build/**" \
					-not -path "**/.build/**" \
					-not -path "**/DrivedData/**" \
					-not -path "**/fastlane/**" \
					-not -path "**/vendor/**"); do
	case $(basename $f) in
		Pods.xcodeproj|Sample.xcodeproj|dummy.xcodeproj)
		#echo "skipping ${f}"
		continue
	esac

	echo "${GREEN}synx ${f}${NORMAL}"
	PARAMS="--no-sort-by-name -q${prune} ${f}"
	sh $script_full_path/bundle/bundle.sh exec synx ${PARAMS}
done
