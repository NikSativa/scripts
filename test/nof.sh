#!/bin/sh
source $(dirname "$0")/../colors.sh

silent=false
fromCurrentFolder=true

for i in "$@"
do
	case $i in
		-s|-silent)
		  silent=true
		;;
		-r|-root)
		  fromCurrentFolder=false
		;;
	esac
done

if $fromCurrentFolder
then
	DIR="./"
else
	DIR=$(git rev-parse --show-cdup)
fi

declare -a RESULT=()
declare -a FILES=$(find . -name "*.swift" \
					-not -path "**/.bundle/**" \
					-not -path "**/Pods/**" \
					-not -path "**/.bin/**" \
					-not -path "**/Build/**" \
					-not -path "**/.build/**" \
					-not -path "**/DrivedData/**" \
					-not -path "**/fastlane/**" \
					-not -path "**/vendor/**" \
					-not -path "**/Quick/**" \
					-not -path "**+Quick**" \
					-not -path "**Quick+**")
for FILE in ${FILES[@]}
do
	if grep -q -e '^ *fdescribe(' \
	           -e '^ *fdescribeHeader(' \
						 -e '^ *fcontext(' \
						 -e '^ *fit(' \
						 -- "$FILE"
	then
		RESULT+=($FILE)
	fi
done

if [ ${#RESULT[@]} == 0 ]
then
	echo "${GREEN}No focuses to remove${NORMAL}"
	exit 0
fi

if $silent
then
	for FILE in ${RESULT[@]}
	do
		FILE=$(basename "$FILE")
		echo "${RED}$FILE${NORMAL}"
	done

	echo "${CYAN}${BOLD}Do not commit fdescribe, fcontext or fit${NORMAL}"
exit 1
else
	for FILE in ${RESULT[@]}
	do
		sed -i '' -e 's/fit(/it(/g;' \
		          -e 's/fcontext(/context(/g;' \
							-e 's/fdescribe(/describe(/g;' \
							-e 's/fdescribeHeader(/describeHeader(/g;' \
							$FILE

		FILE=$(basename "$FILE")
		echo "${GREEN}$FILE${NORMAL}"
	done

	echo "${GREEN}${BOLD}Removed all focuses${NORMAL}"
	exit 0
fi
