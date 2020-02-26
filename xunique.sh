#!/bin/sh

for f in $(find . -name "*.xcodeproj" -not -path "./.bundle/*"); do 

case $(basename $f) in
Pods.xcodeproj|Sample.xcodeproj|dummy.xcodeproj)
#echo "skipping ${f}"
;;
*)
echo $f
xunique $f -c
;;
esac

done
