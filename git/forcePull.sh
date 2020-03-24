#!/bin/sh

git fetch --all
git pull

git submodule foreach 'git fetch --all;
git submodule update --recursive;
git clean -dfx'
