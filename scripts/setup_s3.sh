#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

ssh ubuntu@$SERVER_IP sudo apt install -y s3fs
export S3_ACCESS_KEY_ID=`cat secrets/s3-access-key-id.pw | tr -d '\n'`
export S3_SECRET_ACCESS_KEY=`cat secrets/s3-access-key-secret.pw | tr -d '\n'`
export S3_BUCKET=`cat secrets/s3-bucket.pw | tr -d '\n'`
ssh ubuntu@$SERVER_IP "echo $S3_ACCESS_KEY_ID:$S3_SECRET_ACCESS_KEY > ~/.passwd-s3fs && chmod 600 ~/.passwd-s3fs"
ssh ubuntu@$SERVER_IP "mkdir -p ~/s3 && s3fs ${S3_BUCKET} ~/s3 -o endpoint=$AWS_DEFAULT_REGION -o passwd_file=~/.passwd-s3fs"
