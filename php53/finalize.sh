#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get remove --purge \
  make \
  gcc \
  autoconf \
  bison \
  re2c \
  file \
  flex \
  libxpm-dev \
  libsasl2-dev \
  libpspell-dev \
  libreadline-dev \
  libaspell-dev \
  libxml2-dev \
  libbz2-dev \
  libzip-dev \
  zlib1g-dev \
  libcurl4-openssl-dev \
  libc-client-dev \
  libfreetype6-dev \
  libpng12-dev \
  libmcrypt-dev \
  libtidy-dev \
  libxslt1-dev \
  libgnutls-dev \
  krb5-multidev \
  libapparmor-dev \
  libapr1-dev \
  libaprutil1-dev \
  libbsd-dev \
  libdb-dev \
  libdb5.3-dev \
  libexpat1-dev \
  libfontconfig1-dev \
  libgcrypt11-dev \
  libgcrypt20-dev \
  libgd-dev \
  libglib2.0-dev \
  libgmp3-dev \
  libgpg-error-dev \
  libice-dev \
  libjbig-dev \
  libjpeg-dev \
  libjpeg-turbo8-dev \
  libjpeg8-dev \
  libkrb5-dev \
  libldap2-dev \
  libltdl-dev \
  liblzma-dev \
  libmagic-dev \
  libmhash-dev \
  libmysqlclient-dev \
  libonig-dev \
  libpcre3-dev \
  libpq-dev \
  libqdbm-dev \
  librecode-dev \
  libsctp-dev \
  libsm-dev \
  libsqlite3-dev \
  libsystemd-dev \
  libtiff5-dev \
  libvpx-dev \
  libwebp-dev \
  libxmlrpc-epi-dev \
  libxmltok1-dev \
  libxt-dev \
  unixodbc-dev \
  uuid-dev \
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
