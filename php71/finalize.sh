#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# remove a ton of packages needed for compilation of apcu and apcu-bc
apt-get remove -y --purge \
  autoconf \
  automake \
  autotools-dev \
  build-essential \
  dpkg-dev \
  file \
  libpcre16-3 \
  libpcre3-dev \
  libpcre32-3 \
  libpcrecpp0v5 \
  libquadmath0 \
  libssl-dev \
  libtool \
  linux-libc-dev \
  m4 \
  php7.1-dev \
  shtool \
  zlib1g-dev \
  #

# but keep make and g++ ... to not confuse with above list, just install again if needed
minimal_apt_get_install \
  make \
  g++


apt-get clean
rm -rf \
	/var/lib/apt/lists/* \
	/tmp/* \
	/var/tmp/* \
	/usr/local/src/* \
	#

rm -rf /pd_build
