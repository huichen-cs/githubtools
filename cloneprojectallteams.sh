#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 ORGNIZATION_NAME PROJECT_PREFIX"
    exit 1
fi
ORG=$1
PROJECTPREFIX=$2

SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f ${SCRIPTPATH}/githuboauth_gitignored.sh ]; then
    . ${SCRIPTPATH}/githuboauth_gitignored.sh
else
    . ${SCRIPTPATH}/githuboauth.sh
fi


REPOS=`${SCRIPTPATH}/listallteamreposurl.sh ${ORG} | grep ${PROJECTPREFIX}`

for ANREPO in ${REPOS}; do
    git clone ${ANREPO}
done



