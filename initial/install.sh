#!/bin/sh

script_full_path=$(dirname "$0")

copy() {
    file_name=$1

    if [ ! -f "./${file_name}" ]; then
	    cp -r "${script_full_path}/${file_name}" "./${file_name}"
    fi
}

copy ".swiftlint.yml"
copy "Gemfile"
copy ".gitignore"
copy ".bundle/"
