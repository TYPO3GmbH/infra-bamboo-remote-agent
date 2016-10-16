#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Install Redis Server
minimal_apt_get_install \
  redis-server \
  #

## Enable nginx daemon
cp -a /pd_build/runit/redis-server /etc/service/redis-server
