#!/bin/bash

echo "Removing global SwiftUI cache"

xcrun simctl --set previews delete all
