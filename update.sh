#!/bin/sh

source $(dirname "$0")/colors.sh

synxPrune=""
pruneTags=false
podUpdate=false
closeXcode=true
cleanup=false
help=false

for i in "$@"
do
    case $i in
        -pt|-pruneTags)
            pruneTags=false
        ;;

        +pt|+pruneTags)
            pruneTags=true
        ;;

        -x|-xcode)
            closeXcode=false
        ;;

        +x|+xcode)
            closeXcode=true
        ;;

        -c|-cleanup)
            cleanup=false
        ;;

        +c|+cleanup)
            cleanup=true
        ;;

        -p|-pod)
            podUpdate=false
        ;;

        +p|+pod)
            podUpdate=true
        ;;

        +sp|+prune|+synxPrune)
            synxPrune="+p"
        ;;

        -sp|-prune|-synxPrune)
            synxPrune=""
        ;;

        -h|-help|+help|help)
            help=true
        ;;
    esac
done

if $help
then
    echo "
    Close Xcode at the beginning and open Xcode at the end:
    -x|-xcode             ${BOLD}disable${NORMAL}
    +x|+xcode             ${BOLD}enable${NORMAL} (default)

    Synx unused files from disk:
    -sp|-prune|-synxPrune ${BOLD}prune${NORMAL} (default)
    +sp|+prune|+synxPrune ${BOLD}prune${NORMAL}

    Remove DerivedData and SPM cache:
    -c|-cleanup           ${BOLD}disable${NORMAL} (default)
    +c|+cleanup           ${BOLD}enable${NORMAL}

    Cocoapods:
    -p|-pod               ${BOLD}pod install${NORMAL} (default)
    +p|+pod               ${BOLD}pod update${NORMAL}

    Removing local tags which are not represented remotely - ${RED}${BOLD}dangerous behavior! be careful ${NORMAL}
    -pt|-pruneTags        ${BOLD}disable${NORMAL} (default)
    +pt|+pruneTags        ${BOLD}enable${NORMAL}

    Current ${BOLD}help${NORMAL}
    -h|-help|+help|help
    "
    exit 0
fi

script_full_path=$(dirname "$0")

if $closeXcode
then
    echo "====> killing Xcode"
    killall Xcode
    sleep 1
fi

echo "====> removing DSStore"
sh $script_full_path/rm/DSStore.sh

if $cleanup
then
    echo "====> cleaning project from Xcode cached data"
    sh $script_full_path/rm/cleanup.sh
fi

if $pruneTags
then
    echo "====> pruning local tags"
    sh $script_full_path/git/prune_local_tags.sh
fi

if $podUpdate
then
    echo "====> updating pods"
    sh $script_full_path/pod/update.sh
else
    echo "====> installing pods"
    sh $script_full_path/pod/install.sh
fi

if $closeXcode
then
    echo "====> open Xcode"
    sleep 1
    xed .
fi
