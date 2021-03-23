#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

source scripts/setup_ssh.sh

# Send configs
rsync -av to_server/dotfiles/.[^.]* ubuntu@$SERVER_IP:/home/ubuntu
# Vnc passwd can not have 777 rights or it will be deleted when starting vncserver
ssh ubuntu@$SERVER_IP chmod 600 /home/ubuntu/.vnc/passwd
