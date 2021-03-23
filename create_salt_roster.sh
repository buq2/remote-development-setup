#!/bin/bash
source setup_ssh.sh

mkdir salt
tee salt/roster > /dev/null <<EOT
remote-dev:
  host: $SERVER_IP
  user: ubuntu
EOT
