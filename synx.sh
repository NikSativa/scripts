#!/bin/sh

for f in $(find . -name "*.xcodeproj"); do 

case $(basename $f) in
Pods.xcodeproj|Sample.xcodeproj|dummy.xcodeproj)
#echo "skipping ${f}"
;;
*)
#echo $f
[ -d "./bin" ] && ./bin/synx -q -p $f || synx -q -p $f
;;
esac

done
