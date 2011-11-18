#!/bin/bash

#
# http://www.smarty.net/
#

TARFILE='http://www.smarty.net/files/Smarty-3.1.5.tar.gz'

cd /usr/local/src
sudo wget $TARFILE
sudo tar zxvpf Smarty-*.gz
sudo rm -f *.gz
sudo mkdir -p /usr/local/lib/php/Smarty
sudo cp -r Smarty-*/libs/* /usr/local/lib/php/Smarty
