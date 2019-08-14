#!/bin/sh

git submodule foreach 'git add .;git commit -a -m "no message"; git push origin master' 
git commit -a -m "no message"; git push origin master
