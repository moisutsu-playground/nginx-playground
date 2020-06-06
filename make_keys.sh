#!/bin/bash

KEYS_DIR="nginx/keys"

if [ ! -d $KEYS_DIR ]; then
    mkdir $KEYS_DIR
fi

openssl req -x509 -out localhost.crt -keyout localhost.key \
-newkey rsa:2048 -nodes -sha256 \
-subj '/CN=localhost' -extensions EXT -config <( \
printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

mv localhost.crt localhost.key $KEYS_DIR
