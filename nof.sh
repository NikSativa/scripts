#!/bin/sh

## Don't commit focused tests.
## Use this as a pre-commit hook and the commit won't succeed if you have staged changes that contain `fdescribe`, `fcontext`, `fit`, `fspecify` or `fexample`.
## Copy this file as `pre-commit` into the `.git/hooks` folder of your repository (create it if neccessary) and chmod +x the file.

echo "Pre-commit hook to block focused tests"

if git rev-parse --verify HEAD >/dev/null 2>&1
then
    against=HEAD
else
    # Initial commit: diff against an empty tree object
    against=$(git hash-object -t tree /dev/null)
fi

SAVEIFS=$IFS
IFS=$'\n'
for FILE in `git diff-index --diff-filter=AM --name-only $against`
do
    # Check if the file contains patterns
    if git grep --cached -q -e '^ *fdescribe' -e '^ *fcontext' -e '^ *fit' -- $FILE
    then
        echo $FILE  ': Commit blocked to prevent commiting test focus. (do not commit fdescribe, fcontext, or fit)'
        exit 1
    fi
done

IFS=$SAVEIFS
echo "Commit ok, no focused tests found in staged changes"

exit
