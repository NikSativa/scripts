#!/bin/bash

source $(dirname "$0")/../colors.sh

out=$(swift build)
echo "${GREEN}${out}${NORMAL}"
