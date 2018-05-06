#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

apt-get clean
apt-get -y autoremove
rm -rf /var/lib/apt/lists/*
rm -rf /bd_build
rm -rf /tmp/* /var/tmp/*
rm -f /etc/dpkg/dpkg.cfg.d/docker-apt-speedup
