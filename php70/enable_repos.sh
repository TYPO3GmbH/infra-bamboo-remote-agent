#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# mssql and tools
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | tee /etc/apt/sources.list.d/mssql-server.list
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

## NodeSource's Node.js repository
curl --fail -sL https://deb.nodesource.com/setup_4.x | bash -
