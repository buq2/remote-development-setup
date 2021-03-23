# Build and usage

```
docker build -t terraform-aws .
docker run --rm -it -v `pwd -W`:/data terraform-aws
```

```
source init_terraform.sh
source setup_ssh_keys.sh
source setup_wireguard.sh
vncpasswd dotfiles/.vnc/passwd

terraform init
terraform apply

# Find public ip
source setup_ssh.sh
# Now you should be able to ssh with user `ubuntu`
ssh ubuntu@$SERVER_IP

# Wireguard
source setup_wireguard_client.sh

# Salt
source create_salt_roster.sh
salt-ssh '*' -c ./salt test.ping

# Destroy everything
terraform destroy
``` 
