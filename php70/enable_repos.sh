#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get update

# for msodbcsql17 mssql-tools sqlserv
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

apt-get update
apt-get -y dist-upgrade
