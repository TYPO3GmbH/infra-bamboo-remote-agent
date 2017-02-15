#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Install MariaDB
minimal_apt_get_install \
  postgresql \
  #

## Additional config files
#cp /pd_build/config/mysql/*.cnf /etc/mysql/mariadb.conf.d/

## Provide grants.sql
#cp /pd_build/config/mysql/grants.sql /etc/mysql/grants.sql

## Enable mysql
#cp -a /pd_build/runit/mysql /etc/service/mysql
