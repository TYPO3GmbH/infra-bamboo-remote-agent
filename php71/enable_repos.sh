#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get update

# ondrej with php 7.1
echo deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main > /etc/apt/sources.list.d/php.list

# ondrej key - the recv-keys part takes a bit of time, so it's faster to receive multiple keys at once.
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
    E5267A6C \
    #

apt-get update
apt-get -y dist-upgrade
