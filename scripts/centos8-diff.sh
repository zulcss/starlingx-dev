#!/bin/bash
# Determines the changes between master and a centos8 branch

repo=$1
if [ -z $MY_REPO ]; then
    echo "unable to determine repo"
    exit 1
else
   dir="$MY_REPO/stx/$repo"
   if [ ! -d $dir ]; then
       echo "project does not exist"
       exit 1
    else
        echo "==== $repo ==="
        pushd $dir
        git remote add upstream https://opendev.org/starlingx/$repo
        git fetch upstream
        git log --cherry --no-merges --oneline upstream/master..upstream/f/centos8
        popd
    fi
fi

