#!/bin/bash

source $(dirname "$0")/../colors.sh

out=$(swift --version)
echo "${GREEN}${out}${NORMAL}"
