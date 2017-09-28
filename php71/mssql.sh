#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

ACCEPT_EULA=Y minimal_apt_get_install \
  mssql-server \
  sudo \
  mssql-tools \
  unixodbc-dev \
  #

ACCEPT_EULA='Y' MSSQL_PID='Developer' MSSQL_SA_PASSWORD='Test1234!' /opt/mssql/bin/mssql-conf setup || true

## Enable mysql
cp -a /pd_build/runit/mssql /etc/service/mssql
