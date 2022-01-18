#!/bin/sh

for f in $(find . -name "*.xcodeproj" \
					-not -path "**/**/**"); do

case $(basename $f) in
	Pods.xcodeproj|Sample.xcodeproj|dummy.xcodeproj)
	# echo "skipping ${f}"
	continue
esac
	echo $f
	xunique $f -c
done
