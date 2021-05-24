#!/bin/bash

regexp="${1:-*}"
keep="${2:-10}"

count=`git tag -l $regexp | wc -l`
num=0

for t in `git tag -l $regexp --sort=taggerdate`
do
  if [ "$num" -ge `expr $count - $keep` ]
    then
      break
  fi

  git push origin :$t
  git tag -d $t

  num=`expr $num + 1`
  echo "[$num] Removed $t"
done
