#!/bin/bash

echo "Removing '.swiftpm' folders (keeping mirrors.json)"
find . -name .swiftpm -type d -print | while read dir; do
    if [ -d "$dir" ]; then
        # Remove everything inside .swiftpm except mirrors.json
        find "$dir" -mindepth 1 ! -name mirrors.json -exec rm -rf {} + 2>/dev/null || true
    fi
done

sleep 0.1
