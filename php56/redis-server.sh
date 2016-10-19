#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
  redis-server \
  #

cp -a /pd_build/runit/redis-server /etc/service/redis-server
