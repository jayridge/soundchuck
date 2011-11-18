#!/bin/bash

#
# setup for ubuntu 11.04 64-bit
#

## apt-get as much as we can
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y build-essential
sudo apt-get install -y curl wget
sudo apt-get install -y xutils-dev
sudo apt-get install -y nginx-extras
sudo apt-get install -y memcached
sudo apt-get install -y beanstalkd
sudo apt-get install -y php5-cli php5-cgi
sudo apt-get install -y php-pear
sudo apt-get install -y php5-memcache
sudo apt-get install -y sox libsox-dev libsox-fmt-all

## web
WEB_ROOT='/www/soundchuck.com'
sudo mkdir -m 777 -p $WEB_ROOT
sudo mkdir -m 777 -p $WEB_ROOT/data
sudo mkdir -m 777 -p $WEB_ROOT/public
sudo mkdir -m 777 -p $WEB_ROOT/incoming
sudo mkdir -m 777 -p $WEB_ROOT/smarty
sudo mkdir -m 777 -p $WEB_ROOT/smarty/templates
sudo mkdir -m 777 -p $WEB_ROOT/smarty/templates_c
sudo mkdir -m 777 -p $WEB_ROOT/smarty/cache
sudo mkdir -m 777 -p $WEB_ROOT/smarty/configs
sudo chown -R www-data:www-data $WEB_ROOT

## php
sudo cp ../etc/php5/cgi/php.ini /etc/php5/cgi/

## fastcgi
sudo cp ../etc/init.d/php-fastcgi /etc/init.d
sudo update-rc.d php-fastcgi defaults
sudo /etc/init.d/php-fastcgi start

## nginx
sudo cp ../etc/nginx/nginx.conf /etc/nginx/nginx.conf
sudo /etc/init.d/nginx restart

## beanstalkd
sudo cp ../etc/default/beanstalkd /etc/default/beanstalkd
sudo /etc/init.d/beanstalkd restart

## mongo
./install_mongo.sh
sudo cp ../etc/init.d/mongodb /etc/init.d
sudo update-rc.d mongodb defaults
sudo /etc/init.d/mongodb start

## smarty
./install_smarty.sh
