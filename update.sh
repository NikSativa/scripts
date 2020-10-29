#!/bin/sh

podUpdate=false
closeXcode=true
rmDerivedData=true
removeCopyrigts=false
xcodeSort=true

for i in "$@"
do
    case $i in
        -rc|-removeCopyrigts)
            removeCopyrigts=false
        ;;

        +rc|+removeCopyrigts)
            removeCopyrigts=true
        ;;

        -x|-xcode)
            closeXcode=false
        ;;

        +x|+xcode)
            closeXcode=true
        ;;

        -s|-sort)
            xcodeSort=false
        ;;

        +s|+sort)
            xcodeSort=true
        ;;

        -d|-derivedData)
            rmDerivedData=false
        ;;

        +d|+derivedData)
            rmDerivedData=true
        ;;

        -p|-pod)
            podUpdate=false
        ;;

        +p|+pod)
            podUpdate=true
        ;;
    esac
done

script_full_path=$(dirname "$0")

if $closeXcode
then
    echo "====> killing Xcode"
    killall Xcode
    sleep 1
fi

echo "====> removing DSStore"
sh $script_full_path/rm/DSStore.sh

if $rmDerivedData
then
    echo "====> cleaning DerivedData"
    sh $script_full_path/rm/derivedData.sh
fi

if $removeCopyrigts
then
    echo "====> removing copyrights"
    sh $script_full_path/rm/copyrights.sh
fi

if $podUpdate
then
    echo "====> updating pods"
    sh $script_full_path/pod/update.sh
else
    echo "====> installing pods"
    sh $script_full_path/pod/install.sh
fi

if $xcodeSort
then
    echo "====> synx projects"
    sh $script_full_path/synx.sh

    echo "====> xUniquify projects"
    sh $script_full_path/xunique.sh
fi

if $closeXcode
then
    echo "====> open Xcode"
    sleep 1
    xed .
fi

say jobs done
