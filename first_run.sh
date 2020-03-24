#!/bin/sh

if [ "$EUID" -ne 0 ] then
  echo "Please run as root (`sudo` needed)"
  exit 1
fi

xunique=true

for i in "$@"
do

case $i in
    -x=*|-xunique=*)
        case "${i#*=}" in
            1|true|yes)
                xunique=true
            ;;

            0|false|no)
                xunique=false
            ;;

            *) # unknown option
            ;;
        esac
    ;;
done

if $xunique
then
    echo "====> installing pip"
    easy_install pip

    echo "====> installing xUnique"
    pip install xUnique
fi

script_full_path=$(dirname "$0")
echo "====> installing bundle"
sh $script_full_path/bundle/install.sh
