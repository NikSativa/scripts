#!/bin/bash
#
# Usage:
# 1. add this at the top of your script
# source $(dirname "$0")/colors.sh
# 2. add colors like this
# echo "${GREEN}<your text is here>${NORMAL}"

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 2)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
