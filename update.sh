#!/bin/sh

podUpdate=false
pods=true

resetSubmodules=false
forceUpdateMaster=false
closeXcode=true
rmDerivedData=true
removeCopyrigts=false
xcodeSort=true

for i in "$@"
do

case $i in
    -rc=*|-removeCopyrigts=*)
        case "${i#*=}" in
            1|true|yes)
                removeCopyrigts=true
            ;;

            0|false|no)
                removeCopyrigts=false
            ;;

            *) # unknown option
            ;;
        esac
    ;;

    -x=*|-xcode=*)
        case "${i#*=}" in
            1|true|yes)
                closeXcode=true
            ;;

            0|false|no)
                closeXcode=false
            ;;

            *) # unknown option
            ;;
        esac
    ;;

    -s=*|-sort=*)
        case "${i#*=}" in
            1|true|yes)
                xcodeSort=true
            ;;

            0|false|no)
                xcodeSort=false
            ;;

            *) # unknown option
            ;;
        esac
    ;;

    -d=*|-derivedData=*)
        case "${i#*=}" in
            1|true|yes)
                rmDerivedData=true
            ;;

            0|false|no)
                rmDerivedData=false
            ;;

            *) # unknown option
            ;;
        esac

    ;;

    -r=*|-gitReset=*)
        case "${i#*=}" in
            f|force)
                resetSubmodules=true
                forceUpdateMaster=true
            ;;

            s|soft)
                resetSubmodules=true
                forceUpdateMaster=false
            ;;
            
            0|false)
                resetSubmodules=false
                forceUpdateMaster=false
            ;;

            *) # unknown option
            ;;
        esac
    ;;

    -p=*|-pod=*|-pods=*)
        case "${i#*=}" in
            u|update)
                pods=true
                podUpdate=true
            ;;

            i|install)
                pods=true
                podUpdate=false
            ;;

            0|false)
                pods=false
            ;;

            *) # unknown option
            ;;
        esac
    ;;

    *) # unknown option
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

if $resetSubmodules
then
    if $forceUpdateMaster
    then
        echo "====> force reset whole repo to latest version of 'master'"
        sh $script_full_path/git/forcePull.sh
    else
        echo "====> soft update whole repo to latest version of every sub-branches"
        sh $script_full_path/git/softPull.sh
    fi
fi

if $pods
then
    if $podUpdate
    then
        echo "====> updating pods"
        sh $script_full_path/pod/update.sh
    else
        echo "====> installing pods"
        sh $script_full_path/pod/install.sh
    fi
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
