#!/bin/bash
source scripts/setup_ssh.sh

mkdir -p salt
tee salt/roster > /dev/null <<EOT
remote-dev:
  host: $SERVER_IP
  user: ubuntu
EOT
