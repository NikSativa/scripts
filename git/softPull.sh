#!/bin/sh

optionBranchName=${1:-"master"}

if [ $optionBranchName == "HEAD" ]; then
	optionBranchName="master"
fi

git checkout $optionBranchName
git submodule foreach --recursive git checkout $optionBranchName
