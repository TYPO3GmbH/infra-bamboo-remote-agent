#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Install postgres 9.5 and 10
minimal_apt_get_install \
  postgresql-10 \
  postgresql-9.5 \
  #

# Enable postgres
cp -a /pd_build/runit/postgres /etc/service/postgres
cp -a /pd_build/runit/postgres95 /etc/service/postgres95
