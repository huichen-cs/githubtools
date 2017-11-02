#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: listteamrepos TEAM_ID"
    exit 0
fi

TEAMID=$1

SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f githuboauth_gitignored.sh ]; then
    . ${SCRIPTPATH}/githuboauth_gitignored.sh
else
    . ${SCRIPTPATH}/githuboauth.sh
fi

curl -i -H "Authorization: token ${GITHUB_API_TOKEN}" \
    https://api.github.com/teams/${TEAMID}/repos
