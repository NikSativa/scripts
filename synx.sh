#!/bin/sh

for f in $(find . -name "*.xcodeproj" -not -path "./.bundle/*"); do

case $(basename $f) in
Pods.xcodeproj|Sample.xcodeproj|dummy.xcodeproj)
echo "skipping ${f}"
;;
*)
echo $f
[ -d "./bin" ] && ./bin/synx --no-sort-by-name -q $f || synx --no-sort-by-name -q $f
;;
esac

done
