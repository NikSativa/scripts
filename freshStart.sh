#!/bin/sh

sh $(dirname "$0")/update.sh -xcode=true -removeCopyrigts=true -derivedData=true -gitReset=force -pods=update $@
