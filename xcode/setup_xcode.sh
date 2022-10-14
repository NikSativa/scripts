#!/bin/sh

script_full_path=$(dirname "$0")
rsync -r $script_full_path/snippets/ ~/Library/Developer/Xcode/UserData/CodeSnippets/