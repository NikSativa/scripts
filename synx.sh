#!/bin/sh

for f in $(find . -name "*.xcodeproj" -not -path "./.bundle/*" -not -path "./Pods/*" -not -path "./bin/*" -not -path "./Build/" -not -path "./DrivedData/*"); do

case $(basename $f) in
Pods.xcodeproj|Sample.xcodeproj|dummy.xcodeproj)
echo "skipping ${f}"
continue

esac
echo $f
echo $(dirname $f)
#PARAMS='--no-sort-by-name -q '${f}
#[ -d "./bin" ] && ./bin/synx ${PARAMS} || synx ${PARAMS}

done
