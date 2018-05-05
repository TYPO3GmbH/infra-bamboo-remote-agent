#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get update

## ondrej with php 5.6
echo deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main > /etc/apt/sources.list.d/php.list

minimal_apt_get_install \
  dirmngr \
  gpg-agent \
  #

# The recv-keys part takes a bit of time, so it's faster to receive multiple keys at once.
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
	E5267A6C \
  #

# NodeSource's Node.js repository
# disabled with switch to ubuntu 18.04 base
# curl --fail -sL https://deb.nodesource.com/setup_8.x | bash -

apt-get update
apt-get -y dist-upgrade

# Set a hard IP for some typo3.org services for now until maybe anytime server team decides
# to get DNS right again
echo "136.243.44.172 review.typo3.org" >> /etc/hosts
echo "136.243.44.172 git.typo3.org" >> /etc/hosts