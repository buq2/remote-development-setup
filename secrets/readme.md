This directory should contain secrets for the server/client.

# AWS keys for terraform

You need to generate these keys in https://console.aws.amazon.com/iam/home?section=security_credentials#/users

aws-access-key-id.pw - AWS access key id
aws-access-key-secret.pw - AWS access key secret

# SSH keys

Generate with
```
source setup_ssh_keys.sh
```

id_rsa - SSH private key
id_rsa.pub - SSH public key


# Wireguard keys

Generate these with 
```
source setup_wireguard.sh
source setup_wireguard_client.sh
```

wg_client.key - Wireguard client private key
wg_client.key.pub - Wireguard client public key
wg_server.key - Wireguard server private key
wg_server.key.pub - Wireguard server public key
wg_client.conf - Wireguard configuration file for client/laptop.
