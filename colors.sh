#!/bin/bash
#
# Usage: 
# 1. add this at the top of your script
# source $(dirname "$0")/colors.sh
# 2. add colors like this
# echo "${GREEN}<your text is here>${NORMAL}"
# or
# GREEN(<your text is here>)

BOLD_STYLE = $(tput bold)
BOLD_TEXT() {
    return ${BOLD_STYLE}$1${BOLD_STYLE}
}

NORMAL_STYLE = $(tput sgr0)
NORMAL_TEXT() {
    return ${NORMAL_STYLE}$1${NORMAL_STYLE}
}

BLACK_COLOR = $(tput setaf 0)
BLACK() {
    echo ${BLACK_COLOR}$1${BLACK_COLOR}
}

RED_COLOR = $(tput setaf 1)
RED() {
    echo ${RED_COLOR}$1${RED_COLOR}
}

GREEN_COLOR = $(tput setaf 2)
GREEN() {
    echo ${GREEN_COLOR}$1${GREEN_COLOR}
}

YELLOW_COLOR = $(tput setaf 2)
YELLOW() {
    echo ${YELLOW_COLOR}$1${YELLOW_COLOR}
}

BLUE_COLOR = $(tput setaf 4)
BLUE() {
    echo ${BLUE_COLOR}$1${BLUE_COLOR}
}

MAGENTA_COLOR = $(tput setaf 5)
MAGENTA() {
    echo ${MAGENTA_COLOR}$1${MAGENTA_COLOR}
}

CYAN_COLOR = $(tput setaf 6)
CYAN() {
    echo ${CYAN_COLOR}$1${CYAN_COLOR}
}

WHITE_COLOR = $(tput setaf 7)
WHITE() {
    echo ${WHITE_COLOR}$1${WHITE_COLOR}
}
