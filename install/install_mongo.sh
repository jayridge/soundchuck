#!/bin/bash

TARFILE='http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.0.1.tgz'

cd /usr/local/src
sudo wget $TARFILE
sudo tar zxvpf mongodb-linux-*.tgz
sudo rm -f *.tgz
sudo install mongodb-linux-*/bin/* /usr/local/bin/
sudo adduser --system --no-create-home mongodb
sudo pecl install mongo

