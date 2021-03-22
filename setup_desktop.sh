#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

source setup_ssh.sh

ssh ubuntu@$SERVER_IP sudo apt install -y i3 tigervnc-standalone-server tigervnc-common nano dmenu rsync psmisc thunar
ssh ubuntu@$SERVER_IP vncserver -localhost no
