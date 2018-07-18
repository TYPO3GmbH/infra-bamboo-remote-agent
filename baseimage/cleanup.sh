#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get clean
apt-get -y autoremove
rm -rf /var/lib/apt/lists/*
rm -rf /pd_build
rm -rf /tmp/* /var/tmp/*
rm -f /etc/dpkg/dpkg.cfg.d/docker-apt-speedup
