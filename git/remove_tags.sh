#!/bin/bash

keep="${1:-10}"
regexp="${2:-*}"

count=`git tag -l "$regexp" | wc -l`
num=0

echo "Removing all tags except '$regexp' the last $keep tags..."
for t in `git tag -l "$regexp" --sort=taggerdate`
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
