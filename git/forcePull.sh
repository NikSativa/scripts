#!/bin/sh

git fetch --all
git pull

git submodule foreach 'git fetch --all;'
git submodule update --recursive;
git submodule foreach 'git pull --all;' --recursive
git clean -dfx
