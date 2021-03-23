#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

source scripts/init_terraform.sh

terraform destroy -auto-approve
