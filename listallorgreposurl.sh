#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 ORGNIZATION_NAME"
    exit 1
fi

ORG=$1

SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f ${SCRIPTPATH}/githuboauth_gitignored.sh ]; then
    . ${SCRIPTPATH}/githuboauth_gitignored.sh
else
    . ${SCRIPTPATH}/githuboauth.sh
fi

${SCRIPTPATH}/listallorgrepos.sh ${ORG} | grep '"ssh_url"' | \
    awk -F" " '{print $2}'  | sed -e s/,//g | sed -e s/\"//g
