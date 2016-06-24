#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Install NGINX
minimal_apt_get_install nginx

## Create document root
mkdir -p /srv/bamboo-agent-home/xml-data/build-dir/CORE-GTC-CAT
chown -R bamboo:bamboo /srv/bamboo-agent-home

## Disable default site
rm -f /etc/nginx/sites-enabled/default

## Configure NGINX
cp /pd_build/config/nginx/nginx.conf /etc/nginx/nginx.conf
cp /pd_build/config/nginx/upstream-acceptance-tests.conf /etc/nginx/conf.d/
cp /pd_build/config/nginx-sites/* /etc/nginx/sites-enabled/

## Enable nginx daemon
cp -a /pd_build/runit/nginx /etc/service/nginx
