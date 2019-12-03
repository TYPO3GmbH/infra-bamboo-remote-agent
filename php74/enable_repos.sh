#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get update

# ondrej with a php 7.4
echo deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main > /etc/apt/sources.list.d/php.list

# ondrej key - the recv-keys part takes a bit of time, so it's faster to receive multiple keys at once.
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
    E5267A6C \
    #

# for msodbcsql17 mssql-tools sqlserv
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

apt-get update
apt-get -y dist-upgrade
