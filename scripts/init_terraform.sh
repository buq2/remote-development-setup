#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

export AWS_ACCESS_KEY_ID=`cat secrets/aws-access-key-id.pw | tr -d '\n'`
export AWS_SECRET_ACCESS_KEY=`cat secrets/aws-access-key-secret.pw | tr -d '\n'`
export AWS_DEFAULT_REGION="eu-central-1"
export TF_VAR_region=$AWS_DEFAULT_REGION
# Find newest ubuntu 20.04 image
export TF_VAR_ami=`aws ec2 describe-images --owners self amazon 099720109477 --filters "Name=name,Values=*ubuntu*20.04*minimal*" "Name=architecture,Values=x86_64" | jq --raw-output '.Images | sort_by(.CreationDate) | .[-1].ImageId'`

./scripts/setup_ssh_keys.sh
