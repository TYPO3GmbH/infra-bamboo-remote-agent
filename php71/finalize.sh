#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# remove a ton of packages needed for compilation of apcu and apcu-bc
apt-get remove -y --purge \
    autoconf \
    automake \
    autotools-dev \
    file \
    libpcre16-3 \
    libpcre3-dev \
    libpcre32-3 \
    libpcrecpp0v5 \
    libquadmath0 \
    libtool \
    m4 \
    php7.1-dev \
    shtool \
    #

# but keep make and g++ ... to not confuse with above list, just install again if needed
minimal_apt_get_install \
    make \
    g++ \
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
