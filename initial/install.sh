#!/bin/sh

script_full_path=$(dirname "$0")

copy() {
    file_name=$1
    file_name2=$2

    if [ ! -f "./${file_name}" ]; then
	    cp -r "${script_full_path}/${file_name}" "./${file_name2}"
    fi
}

copy "swiftlint.yml" ".swiftlint.yml"
copy "Gemfile"
copy "gitignore" ".gitignore"
copy "bundle/" ".bundle/"

sh $script_full_path/../bundle/install.sh
