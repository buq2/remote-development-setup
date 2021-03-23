#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

source scripts/setup_ssh.sh

ssh ubuntu@$SERVER_IP DEBIAN_FRONTEND=noninteractive sudo --preserve-env=DEBIAN_FRONTEND apt install -y i3 tigervnc-standalone-server tigervnc-common nano dmenu rsync psmisc thunar
ssh ubuntu@$SERVER_IP vncserver -localhost no
