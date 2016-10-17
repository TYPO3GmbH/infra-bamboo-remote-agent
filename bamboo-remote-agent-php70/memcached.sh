#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Install Redis Server
minimal_apt_get_install \
  memcached \
  #

## Enable nginx daemon
cp -a /pd_build/runit/memcached /etc/service/memcached
