#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get remove --purge \
  autoconf \
  bison \
  dpkg-dev \
  file \
  flex \
  gcc \
  krb5-multidev \
  libapparmor-dev \
  libapr1-dev \
  libaprutil1-dev \
  libaspell-dev \
  libbsd-dev \
  libbz2-dev \
  libc-client2007e-dev \
  libcurl4-openssl-dev \
  libdb-dev \
  libdb5.3-dev \
  libexpat1-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libgcrypt11-dev \
  libgcrypt20-dev \
  libgd-dev \
  libglib2.0-dev \
  libgmp3-dev \
  libgnutls-dev \
  libgpg-error-dev \
  libice-dev \
  libidn11-dev \
  libjbig-dev \
  libjpeg-dev \
  libjpeg-turbo8-dev \
  libjpeg8-dev \
  libkrb5-dev \
  libldap2-dev \
  libltdl-dev \
  liblzma-dev \
  libmagic-dev \
  libmcrypt-dev \
  libmhash-dev \
  libmysqlclient-dev \
  libonig-dev \
  libpcre3-dev \
  libpng12-dev \
  libpq-dev \
  libpspell-dev \
  libqdbm-dev \
  libreadline-dev \
  librecode-dev \
  libsasl2-dev \
  libsctp-dev \
  libsm-dev \
  libsqlite3-dev \
  libssl-dev \
  libsystemd-dev \
  libtidy-dev \
  libtiff5-dev \
  libtool \
  libvpx-dev \
  libwebp-dev \
  libxml2-dev \
  libxmlrpc-epi-dev \
  libxmltok1-dev \
  libxpm-dev \
  libxslt1-dev \
  libxt-dev \
  libzip-dev \
  make \
  pkg-config \
  re2c \
  unixodbc-dev \
  uuid-dev \
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
