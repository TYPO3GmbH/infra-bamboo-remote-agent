#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# remove a ton of packages needed for compilation of php modules
apt-get remove -y --purge \
    autoconf \
    autotools-dev \
    file \
    libquadmath0 \
    libtool \
    php7.4-dev \
    #

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
