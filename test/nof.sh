#!/bin/sh
source $(dirname "$0")/../colors.sh

DIR=$(git rev-parse --show-cdup)

declare -a RESULT=()
declare -a FILES=$(find $DIR -type f -regex ".*\.swift")
for FILE in ${FILES[@]}
do
   if [[ ! $FILE == */Pods/* ]]
   then
      if grep -q -e '^ *fdescribe(' -e '^ *fcontext(' -e '^ *fit(' -- "$FILE"
      then
         RESULT+=($FILE)
      fi
   fi
done

if [ ${#RESULT[@]} == 0 ]
then
   echo "${GREEN}No focuses to remove${NORMAL}"
else
   for FILE in ${RESULT[@]}
   do
      FILE=$(basename "$FILE")
      echo "${RED}$FILE${NORMAL}"
   done
   echo "${CYAN}${BOLD}Do not commit: fdescribe, fcontext, or fit${NORMAL}"
fi
