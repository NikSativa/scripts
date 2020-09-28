#!/bin/bash

source $(dirname "$0")/../colors.sh

out=$(swift update)
echo "${GREEN}${out}${NORMAL}"
