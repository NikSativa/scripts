#!/bin/bash

find . -type f -name "*.swift" -not -path "./Pods/*" -exec sed -i '' -e '1,/^import/{/^\/\/.*/d;}' -e '/./,$!d' {} \;
