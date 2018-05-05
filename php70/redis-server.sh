#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
  redis-server \
  #

cp -a /pd_build/runit/redis-server /etc/service/redis-server

sed -i 's/daemonize yes/daemonize no/' /etc/redis/redis.conf
sed -i 's/bind 127.0.0.1 ::1/bind 127.0.0.1/' /etc/redis/redis.conf
