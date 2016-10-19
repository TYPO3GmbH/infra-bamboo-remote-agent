#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
  memcached \
  #

cp -a /pd_build/runit/memcached /etc/service/memcached
