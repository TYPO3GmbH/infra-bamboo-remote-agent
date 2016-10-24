#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# remove a ton of packages needed for compilation of apcu and apcu-bc
apt-get remove -y --purge \
  autoconf \
  automake \
  autotools-dev \
  binutils \
  cpp \
  cpp-5 \
  file \
  gcc \
  gcc-5 \
  libasan2 \
  libatomic1 \
  libc-dev-bin \
  libc6-dev \
  libcc1-0 \
  libcilkrts5 \
  libgcc-5-dev \
  libisl15 \
  libitm1 \
  liblsan0 \
  libmpc3 \
  libmpfr4 \
  libmpx0 \
  libpcre16-3 \
  libpcre3-dev \
  libpcre32-3 \
  libpcrecpp0v5 \
  libquadmath0 \
  libsigsegv2 \
  libssl-dev \
  libtool \
  libtsan0 \
  libubsan0 \
  linux-libc-dev \
  m4 \
  make \
  php7.0-dev \
  shtool \
  zlib1g-dev \
  #

apt-get clean
rm -rf \
	/var/lib/apt/lists/* \
	/tmp/* \
	/var/tmp/* \
	/usr/local/src/* \
	/usr/include/php/20151012/ext/apcu/ \
	#

rm -rf /pd_build
