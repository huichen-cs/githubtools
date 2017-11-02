#!/bin/bash

for d in *; do
    if [ -d "${d}" ]; then
        cd ${d}
        git stash
        git pull
        rtnvalue=$?
        echo On $d returned code: $?
        if [ ${rtnvalue} -ne 0 ]; then
            echo Attempt to clear up
            git clean -f -d
            git fetch --all
            git reset --hard origin/master
            echo On $d returned code: $?
        fi
        cd ..
    fi
done
