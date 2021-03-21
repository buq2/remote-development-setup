echo This file must be sourced

export AWS_ACCESS_KEY_ID=`cat aws-access-key-id.pw | tr -d '\n'`
export AWS_SECRET_ACCESS_KEY=`cat aws-access-key-secret.pw | tr -d '\n'`
export AWS_DEFAULT_REGION="eu-central-1"
export TF_VAR_region=$AWS_DEFAULT_REGION
