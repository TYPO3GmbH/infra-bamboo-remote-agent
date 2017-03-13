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

SA_PASSWORD='Test1234!' /opt/mssql/lib/mssql-conf/mssql-conf.py setup accept-eula || true