#!/bin/sh
source $(dirname "$0")/../colors.sh

DIR=$(git rev-parse --show-cdup)

declare -a RESULT=()
for FILE in $(find $DIR -regex ".*\.swift")
do
   if [[ ! $FILE == */Pods/* ]]
   then
      if grep -q -e '^ *fdescribe(' -e '^ *fcontext(' -e '^ *fit(' -- "$FILE"
      then
         RESULT+=($(basename "$FILE"))
      fi
   fi
done

if [ ${#RESULT[@]} == 0 ]
then
   echo "${GREEN}No focuses to remove${NORMAL}"
else
   for FILE in ${RESULT[@]}
   do
      echo "${RED}$FILE${NORMAL}"
   done
   echo "${RED}${BOLD}do not commit fdescribe, fcontext, or fit${NORMAL}"
fi
