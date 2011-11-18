#!/bin/bash

sudo openssl genrsa -out soundchuck.key 1024
sudo openssl req -new -key soundchuck.key -out soundchuck.csr
sudo openssl req -config /usr/lib/ssl/openssl.cnf -new -key soundchuck.key -out soundchuck.csr
sudo openssl x509 -req -days 36500 -in soundchuck.csr -signkey soundchuck.key -out soundchuck.crt
sudo cp soundchuck.crt /etc/nginx
sudo cp soundchuck.key /etc/nginx
