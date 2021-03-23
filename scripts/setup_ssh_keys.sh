#!/bin/bash
FILENAME=/data/secrets/id_rsa
if ! test -f $FILENAME; then
    echo "Generating ssh keys"
    ssh-keygen -t rsa -b 4096 -C "buq2@buq2.com" -f $FILENAME -q -N ""
fi
