#!/bin/sh

git fetch --all
git pull

git submodule foreach 'git fetch --all;'
git pull;
git submodule update --recursive;
