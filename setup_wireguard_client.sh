#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

# Print client config
source setup_wireguard.sh
#source setup_ssh.sh #needed for IP
SERVER_PUBLIC_KEY=`cat ${FILENAME_SERVER_PRIVATE}.pub | tr -d '\n'`
CLIENT_PRIVATE_KEY=`cat ${FILENAME_CLIENT_PRIVATE} | tr -d '\n'`

echo ===== Wireguard client config START ======
tee secrets/wg_client.conf <<EOT
[Interface]
PrivateKey = ${CLIENT_PRIVATE_KEY}
Address = 10.0.1.3/32

[Peer]
PublicKey = ${SERVER_PUBLIC_KEY}
AllowedIPs = 10.0.1.0/24
Endpoint = ${SERVER_IP}:1294
PersistentKeepalive = 60
EOT
echo ===== Wireguard client config END ======
