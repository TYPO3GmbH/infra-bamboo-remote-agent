#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# make sure npm is kept ... this will probably remove phpX.Y-dev and others, though.
# https://bugs.launchpad.net/ubuntu/+source/nodejs/+bug/1794589
minimal_apt_get_install npm nodejs make g++

apt-get clean
apt-get -y autoremove
rm -rf \
    /var/lib/apt/lists/* \
    /root/.npm/ \
    /tmp/* \
    /var/tmp/* \
    /usr/local/src/* \
    #

rm -rf /pd_build
