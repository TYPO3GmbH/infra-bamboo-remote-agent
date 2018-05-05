#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get clean
apt-get -y autoremove
rm -rf \
	/tmp/* \
	/var/tmp/* \
	/usr/local/src/* \
	/usr/include/php/20151012/ext/apcu/ \
	#

rm -rf /pd_build
