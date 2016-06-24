#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## NGINX Stable Releases
echo deb http://ppa.launchpad.net/nginx/stable/ubuntu xenial main > /etc/apt/sources.list.d/nginx-stable.list


# The recv-keys part takes a bit of time, so it's faster to receive multiple keys at once.
#
# Brightbox
# Phusion Passenger
# Rowan's Redis PPA
# OpenJDK 8 PPA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
	C300EE8C \
  #

## NodeSource's Node.js repository
curl --fail -sL https://deb.nodesource.com/setup_4.x | bash -
