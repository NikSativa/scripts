#!/bin/sh

# Don't commit focused tests.
# Use this as a pre-commit hook and the commit won't succeed if you have staged changes that contain `fdescribe`, `fcontext`, `fit`, `fspecify` or `fexample`.
# Copy this file as `pre-commit` into the `.git/hooks` folder of your repository (create it if neccessary) and chmod +x the file.

STATUS=0

for focus in fdescribe fcontext fit fspecify fexample; do
    FILES=$(git diff --staged -G"^\s*$focus\(" --name-only | wc -l)
    if [ $FILES -gt 0 ]
    then
        echo "You forgot to remove a $focus in the following files:"
        git diff --staged --name-only -G"^\s*$focus\("
        echo ""
        STATUS=1
    fi
done

exit $STATUS
