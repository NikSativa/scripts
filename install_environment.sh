#!/bin/sh

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
esac
done

script_full_path=$(dirname "$0")

if $xunique
then
    echo "====> installing pip"
    sudo easy_install pip

    echo "====> installing xUnique"
    sudo pip install xUnique
fi

sh $script_full_path/initila/install.sh

echo "====> installing bundler"
sudo gem install bundler

echo "====> installing bundler"
sudo gem install bundler

echo "====> installing bundle"
sh $script_full_path/bundle/install.sh

exit 0
