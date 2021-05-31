#!/bin/sh

source $(dirname "$0")/colors.sh

synxPrune=""
pruneTags=false
podUpdate=false
closeXcode=true
cleanup=false
xcodeSort=true
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

        -s|-sort)
            xcodeSort=false
        ;;

        +s|+sort)
            xcodeSort=true
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

        -h|-help|+help|help)
            help=true
        ;;
    esac
done

if $help
then
    echo "
    -x|-xcode              ${BOLD}disable${NORMAL}: close Xcode at the beginning and open Xcode at the end
    +x|+xcode              ${BOLD}enable${NORMAL}:  close Xcode at the beginning and open Xcode at the end

    -s|-sort               ${BOLD}disable${NORMAL}: synx & xUnique xcodeproj
    +s|+sort               ${BOLD}enable${NORMAL}:  synx & xUnique xcodeproj (default parameter)

    -d|-derivedData        ${BOLD}disable${NORMAL}: remove DerivedData (enabled by default)
    +d|+derivedData        ${BOLD}enable${NORMAL}:  remove DerivedData (enabled by default)

    -p|-pod                ${BOLD}pod install${NORMAL} (default parameter)
    +p|+pod                ${BOLD}pod update${NORMAL}

    +sp|+prune|+synxPrune  ${BOLD}prune${NORMAL} unused files from disk (disabled by default)

    -h|-help|+help|help    current ${BOLD}help${NORMAL}
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

if $xcodeSort
then
    echo "====> synx projects "
    sh $script_full_path/synx.sh $synxPrune

    echo "====> xUniquify projects"
    sh $script_full_path/xunique.sh
fi

if $closeXcode
then
    echo "====> open Xcode"
    sleep 1
    xed .
fi
