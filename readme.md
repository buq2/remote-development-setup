# Secrets

terraform init 

# Build and usage

```
docker build -t terraform-aws .
docker run --rm -it -v `pwd -W`:/data terraform-aws
source init.sh
```

```
# Find newest ubuntu 20.04 image
export TF_VAR_ami=`aws ec2 describe-images --owners self amazon 099720109477 --filters "Name=name,Values=*ubuntu*20.04*minimal*" "Name=architecture,Values=x86_64" | jq --raw-output '.Images | sort_by(.CreationDate) | .[-1].ImageId'`
```

Use the ami to modify `aws.tf` or use it as an env.

```
# Generate ssh keys
ssh-keygen -t rsa -b 4096 -C "buq2@buq2.com" -f /data/id_rsa

terraform init
terraform apply

# Find public ip
export SERVER_IP=`terraform show -json | jq --raw-output '.. | .public_ip? // empty'`
# No you should be able to ssh with user `ubuntu`
ssh -i id_rsa ubuntu@$SERVER_IP

# Destroy everything
terraform destroy
``` 
