# remote-development-setup

This repo contains scripts/etc for quickly creating cheap but usable remote development machine on AWS.
The goal is to practice use of Terraform to setup single remote machine with tools for both cli and gui development.

CLI development works with vscode+ssh and if desktop environment is needed VNC connection through wireguard VPN tunnel can be used.

S3 is used for long term storage.


## Build and usage

```
docker build -t terraform-aws .
docker run --rm -it -v `pwd -W`:/data terraform-aws
```
## Create remote dev setup

```
source up.sh
```

## Destroy remote dev setup

```
source down.sh
```
