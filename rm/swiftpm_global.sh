#!/bin/bash

echo "Removing global swiftpm cache (keeping mirrors.json and SPM Collections)"

# Remove everything inside ~/Library/Caches/org.swift.swiftpm except mirrors.json and package-collection.db*
if [ -d ~/Library/Caches/org.swift.swiftpm ]; then
    find ~/Library/Caches/org.swift.swiftpm -mindepth 1 \
        ! -name mirrors.json ! -name 'package-collection.db*' \
        -exec rm -rf {} + 2>/dev/null || true
fi

# Remove everything inside ~/Library/org.swift.swiftpm except mirrors.json
if [ -d ~/Library/org.swift.swiftpm ]; then
    find ~/Library/org.swift.swiftpm -mindepth 1 ! -name mirrors.json -exec rm -rf {} + 2>/dev/null || true
fi
