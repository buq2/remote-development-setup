# Secrets

terraform init 

# Build and usage

```
docker build -t terraform-aws .
docker run --rm -it -v `pwd -W`:/data terraform-aws
source init_terraform.sh
```

```
terraform init
terraform apply

# Find public ip
source setup_ssh.sh
# Now you should be able to ssh with user `ubuntu`
ssh ubuntu@$SERVER_IP

# Salt
source create_salt_roster.sh
salt-ssh '*' -c ./salt test.ping

# Destroy everything
terraform destroy
``` 
