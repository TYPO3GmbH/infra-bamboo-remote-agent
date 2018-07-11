#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

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
