#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get update

minimal_apt_get_install \
  dirmngr \
  gpg-agent \
  #

# mssql and tools
# curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
# curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | tee /etc/apt/sources.list.d/mssql-server.list
# curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

# google-chrome
curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

apt-get update
apt-get -y dist-upgrade

# Set a hard IP for some typo3.org services for now until maybe anytime server team decides
# to get DNS right again
echo "136.243.44.172 review.typo3.org" >> /etc/hosts
echo "136.243.44.172 git.typo3.org" >> /etc/hosts