#!/bin/bash

echo "Removing 'DerivedData' folders"
find . -name DerivedData -type d -print -exec rm -rf {} +
sleep 0.1
