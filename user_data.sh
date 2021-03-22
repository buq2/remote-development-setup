#!/bin/bash

# This script will be run automatically when server is created

export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt install -y ufw wireguard

sudo ufw allow 22
sudo ufw allow 1294 # wireguard
yes | sudo ufw enable

sudo tee -a /etc/wireguard/wg0.conf > /dev/null <<EOT
[Interface]
PrivateKey = <redacted>
Address = 10.0.1.1/24
ListenPort = 1294

[Peer]
PublicKey = <redacted>
AllowedIPs = 10.0.1.3/32
EOT

sudo systemctl enable wg-quick@wg0.service
sudo systemctl start wg-quick@wg0.service
sudo ufw allow in on wg0 to any port 5901 # vnc through vpn
