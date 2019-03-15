#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 ORGNIZATION_NAME REPO_PREFIX"
    exit 1
fi
ORG=$1
REPOPREFIX=$2

SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f ${SCRIPTPATH}/githuboauth_gitignored.sh ]; then
    . ${SCRIPTPATH}/githuboauth_gitignored.sh
else
    . ${SCRIPTPATH}/githuboauth.sh
fi


REPOS=`${SCRIPTPATH}/listallorgreposurl.sh ${ORG} | grep ${REPOPREFIX}`

for ANREPO in ${REPOS}; do
    echo clone ${ANREPO}
    git clone ${ANREPO}
done



