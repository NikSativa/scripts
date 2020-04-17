#!/bin/sh

message=${1:-"no message"}

git submodule foreach "git add .;git commit -a -m $\{message}; git push origin master"
git commit -a -m $message; git push origin master
