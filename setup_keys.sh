#!/bin/bash
if ! test -f /data/id_rsa; then
    echo "Generating ssh keys"
    ssh-keygen -t rsa -b 4096 -C "buq2@buq2.com" -f /data/id_rsa -q -N ""
fi
