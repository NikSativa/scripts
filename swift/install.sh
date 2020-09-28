#!/bin/bash

source $(dirname "$0")/../colors.sh

out=$(swiftc install)
echo "${GREEN}${out}${NORMAL}"
