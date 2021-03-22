#!/bin/bash
source setup_ssh.sh

tee salt/roster > /dev/null <<EOT
remote-dev:
  host: $SERVER_IP
  user: ubuntu
EOT
