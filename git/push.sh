#!/bin/sh

message=${1:-"no message"};

git submodule foreach "git add .;git commit -m ${message};";
git add .;
git commit -m $message;
git push --recurse-submodules=on-demand;
