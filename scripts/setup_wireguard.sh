#!/bin/bash
if [[ $_ == $0 ]]
then
    echo "Script must be sourced"
    exit 1
fi

FILENAME_SERVER_PRIVATE=/data/secrets/wg_server.key
if ! test -f $FILENAME_SERVER_PRIVATE; then
    echo "Generating wireguard keys for server"
    (umask 0077; wg genkey | tee ${FILENAME_SERVER_PRIVATE} | wg pubkey > ${FILENAME_SERVER_PRIVATE}.pub)
fi

FILENAME_CLIENT_PRIVATE=/data/secrets/wg_client.key
if ! test -f $FILENAME_CLIENT_PRIVATE; then
    echo "Generating wireguard keys for client"
    (umask 0077; wg genkey | tee ${FILENAME_CLIENT_PRIVATE} | wg pubkey > ${FILENAME_CLIENT_PRIVATE}.pub)
fi

# Update user_data.sh file with the keys
SERVER_PRIVATE_KEY=`cat $FILENAME_SERVER_PRIVATE | tr -d '\n'`
CLIENT_PUBLIC_KEY=`cat ${FILENAME_CLIENT_PRIVATE}.pub | tr -d '\n'`
sed -i "s/PrivateKey =.*/PrivateKey = ${SERVER_PRIVATE_KEY}/" to_server/user_data.sh
sed -i "s/PublicKey =.*/PublicKey = ${CLIENT_PUBLIC_KEY}/" to_server/user_data.sh

