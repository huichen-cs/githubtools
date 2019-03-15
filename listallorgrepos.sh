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

curl -i -H "Authorization: token ${GITHUB_API_TOKEN}" \
    https://api.github.com/orgs/${ORG}/repos

