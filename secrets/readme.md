This directory should contain secrets for the server/client.

# AWS keys for terraform

You need to generate these keys in https://console.aws.amazon.com/iam/home?section=security_credentials#/users
These keys are used with terraform.

aws-access-key-id.pw - AWS access key id
aws-access-key-secret.pw - AWS access key secret

# AWS keys for mounting S3 bucket

These will be copied to the remote server and should have lower access rights than aws-access-key-id.pw and aws-access-key-secret.pw.

Following iam policy works:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:RestoreObject",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME/*"
            ]
        }
    ]
}
```

s3-access-key-secret.pw - AWS access key id for S3 bucket
s3-access-key-secret.pw - AWS access secret for S3 bucket
s3-bucket.pw - Name of the s3 bucket to be mounted

Use `source/setup_s3.sh` to mount the s3 bucket to the remote server.

# SSH keys

Generate with
```
source scripts/setup_ssh_keys.sh
```

id_rsa - SSH private key
id_rsa.pub - SSH public key


# Wireguard keys

Generate these with 
```
source scripts/setup_wireguard.sh
source scripts/setup_wireguard_client.sh
```

wg_client.key - Wireguard client private key
wg_client.key.pub - Wireguard client public key
wg_server.key - Wireguard server private key
wg_server.key.pub - Wireguard server public key
wg_client.conf - Wireguard configuration file for client/laptop.
