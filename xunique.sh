#!/bin/sh

for f in $(find . -name "*.xcodeproj"); do 

case $(basename $f) in
Pods.xcodeproj|Sample.xcodeproj)
#echo "skipping ${f}"
;;
*)
echo $f
xunique $f -c
;;
esac

done
