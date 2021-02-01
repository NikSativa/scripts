#!/bin/sh

for f in $(find . -name "*.xcodeproj" \
					-not -path "**/.bundle/**" \
					-not -path "**/Pods/**" \
					-not -path "**/.bin/**" \
					-not -path "**/Build/**" \
					-not -path "**/.build/**" \
					-not -path "**/DrivedData/**" \
					-not -path "**/fastlane/**" \
					-not -path "**/SourcePackages/**" \
					-not -path "**/vendor/**"); do

case $(basename $f) in
	Pods.xcodeproj|Sample.xcodeproj|dummy.xcodeproj)
	#echo "skipping ${f}"
	continue
esac
	echo $f
	xunique $f -c
done
