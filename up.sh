#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

source scripts/init_terraform.sh
source scripts/setup_ssh_keys.sh
source scripts/setup_wireguard.sh
# vncpasswd to_server/dotfiles/.vnc/passwd

terraform init
terraform apply -auto-approve

source scripts/setup_wireguard_client.sh
source scripts/create_salt_roster.sh
source scripts/send_dotfiles.sh
source scripts/setup_desktop.sh
source scripts/s3.sh
