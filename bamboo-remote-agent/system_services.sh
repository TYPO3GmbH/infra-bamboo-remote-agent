#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Install init process.
cp /pd_build/bin/my_init /sbin/
mkdir -p /etc/my_init.d

# Install runit.
minimal_apt_get_install runit
