#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

if [[ -z "${SSH_AUTH_SOCK}" ]]; then
    echo Starting ssh-agent
    eval `ssh-agent -s`
    ssh-add secrets/id_rsa
fi

if ! ssh -o ConnectTimeout=1 ubuntu@$SERVER_IP echo -n 
then
    echo Finding server ip
    export SERVER_IP=`terraform show -json | jq --raw-output '.. | .public_ip? // empty'`
    ssh-keyscan -t rsa -H $SERVER_IP >> ~/.ssh/known_hosts

    if ! ssh -o ConnectTimeout=1 ubuntu@$SERVER_IP echo -n
    then
        echo Failed to set up ssh
    fi
fi
