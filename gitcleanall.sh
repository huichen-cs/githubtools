#!/bin/bash

for d in *; do
    if [ -d "${d}" ]; then
        cd ${d}
        git clean -df
        cd ..
    fi
done
