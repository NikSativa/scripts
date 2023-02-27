#!/bin/bash

echo "Removing '.swiftpm' folders"
find . -name .swiftpm -type d -print -exec rm -rf {} +
sleep 0.1
