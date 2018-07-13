#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get clean
rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/local/src/* \
    #

rm -rf /pd_build
