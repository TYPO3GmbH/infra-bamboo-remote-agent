#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get remove -y --purge \
  autoconf \
  file \
  flex \
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
  libpq-dev \
  libpspell-dev \
  libqdbm-dev \
  libreadline-dev \
  librecode-dev \
  libsasl2-dev \
  libsctp-dev \
  libsm-dev \
  libsqlite3-dev \
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
  pkg-config \
  re2c \
  unixodbc-dev \
  uuid-dev \
  zlib1g-dev \
  autotools-dev \
  comerr-dev \
  icu-devtools \
  libc-client2007e \
  libdpkg-perl \
  libfl-dev \
  libgmp-dev \
  libgmpxx4ldbl \
  libgnutls-openssl27 \
  libgnutlsxx28 \
  libgssrpc4 \
  libicu-dev \
  libisl15 \
  libitm1 \
  liblsan0 \
  libmagic1 \
  libmpc3 \
  libmpx0 \
  libp11-kit-dev \
  libpam0g-dev \
  libpthread-stubs0-dev \
  libquadmath0 \
  libreadline6-dev \
  libstdc++-5-dev \
  libtasn1-6-dev \
  libtinfo-dev \
  libtsan0 \
  libubsan0 \
  libx11-dev \
  libxau-dev \
  libxcb1-dev \
  libxdmcp-dev \
  m4 \
  mlock \
  nettle-dev \
  x11proto-core-dev \
  x11proto-input-dev \
  x11proto-kb-dev \
  xorg-sgml-doctools \
  xtrans-dev \
  #

# but keep make and g++ ... to not confuse with above list, just install again if needed
minimal_apt_get_install \
  make \
  g++


apt-get clean
apt-get -y autoremove
rm -rf \
    /var/lib/apt/lists/* \
    /root/.npm/ \
	/tmp/* \
	/var/tmp/* \
	/usr/local/src/* \
	/usr/include/php/20151012/ext/apcu/ \
	#

rm -rf /pd_build
