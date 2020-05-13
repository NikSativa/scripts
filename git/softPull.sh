#!/bin/sh

optionBranchName=""

for i in "$@"
do

case $i in
    -b=*|-branch=*)
		optionBranchName="${i#*=}"
    ;;
esac

done

if [ -z $optionBranchName ] || [ $optionBranchName == "HEAD" ]; then
	optionBranchName="master"
fi

git pull origin $optionBranchName
git submodule foreach --recursive git pull origin $optionBranchName
