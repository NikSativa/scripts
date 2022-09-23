#!/bin/bash

if [ -z "$1" ]
  then
    echo "Please, provide 'since date' in format 'Aug 10, 2022'"
    exit
fi

echo branches that will be deleted: 
for k in $(git branch -r | sed /\*/d); do 
  if [ -z "$(git log -1 --since="$1" -s $k)" ]; then
    branch_name_with_no_origin=$(echo $k | sed -e "s/origin\///")
    echo $branch_name_with_no_origin
  fi
done

read -p "Should delete? [y/n]: " answer

if [ "$answer" != "y" ]; then
    exit
fi

for k in $(git branch -r | sed /\*/d); do 
  if [ -z "$(git log -1 --since="$1" -s $k)" ]; then
    branch_name_with_no_origin=$(echo $k | sed -e "s/origin\///")
    echo deleting branch: $branch_name_with_no_origin
    git push origin --delete "$branch_name_with_no_origin"
  fi
done
