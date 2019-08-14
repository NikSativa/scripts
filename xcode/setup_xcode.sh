#!/bin/sh

rsync -r templates/ '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source'
rsync -r snippets/ ~/Library/Developer/Xcode/UserData/CodeSnippets/