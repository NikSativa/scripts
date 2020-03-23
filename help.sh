#!/bin/sh

script_full_path=$(dirname "$0")
echo "$(<$script_full_path/README.md)"
