#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

ssh ubuntu@$SERVER_IP sudo apt install -y build-essential git cmake cmake-curses-gui
