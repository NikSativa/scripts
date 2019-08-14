#!/bin/sh

git fetch --all
git checkout $(git rev-parse --abbrev-ref master)
git reset --hard origin/$(git rev-parse --abbrev-ref master)

git submodule foreach 'git fetch --all; 
git checkout $(git rev-parse --abbrev-ref master); 
git reset --hard origin/$(git rev-parse --abbrev-ref master);
git submodule update --recursive;
git clean -dfx'
