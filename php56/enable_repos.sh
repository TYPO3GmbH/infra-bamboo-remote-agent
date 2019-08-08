#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get update
# currently no 3rd party repos for 5.6 build
apt-get -y dist-upgrade
