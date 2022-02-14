#!/bin/bash

folder_name=${PWD##*/}

script_full_path=$(dirname "$0")

rm -rf $script_full_path/sort_Xcode_project_file
curl -o $script_full_path/sort_Xcode_project_file --location --remote-header-name --remote-name https://github.com/WebKit/WebKit/raw/main/Tools/Scripts/sort-Xcode-project-file
