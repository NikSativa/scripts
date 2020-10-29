#!/bin/sh

script_full_path=$(dirname "$0")

xunique=true

for i in "$@"
do
    case $i in
        -x|-xunique)
            xunique=false
        ;;

        +x|+xunique)
            xunique=true
        ;;
    esac
done

if $xunique
then
    echo "====> installing pip"
    sudo easy_install pip

    echo "====> installing xUnique"
    sudo pip install xUnique
fi

sh $script_full_path/initial/install.sh

echo "====> installing bundle"
sh $script_full_path/bundle/install.sh
