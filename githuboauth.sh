#!/bin/bash 

GITHUB_API_TOKEN=""
export GITHUB_API_TOKEN

SCRIPT=$0
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ x"${GITHUB_API_TOKEN}" == x"" ]; then
    echo -e "\n"
    echo "Set GITHUB_API_TOKEN as your actual GITHUB_API_TOKEN in ${SCRIPT} at ${SCRIPTPATH}."
    echo "See https://github.com/blog/1509-personal-api-tokens for instruction to obtain the API token."
    echo -e "\n"
    exit 1
fi



