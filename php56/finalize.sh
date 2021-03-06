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
    make \
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
    libwrap0 \
    libwrap0-dev \
    libncurses5-dev \
    freetds-dev \
    libaio1 \
    libedit-dev \
    libenchant-dev \
    libenchant1c2a \
    libevent-2.1-6 \
    libevent-core-2.1-6 \
    libevent-dev \
    libevent-extra-2.1-6 \
    libudev-dev \
    libwrap0 \
    libwrap0-dev \
    libsnmp-dev \
    libsnmp-base \
    libsensors4-dev \
    libpci-dev \
    enchant \
    gettext \
    gettext-base \
    libevent-openssl-2.1-6 \
    libevent-pthreads-2.1-6 \
    libpci3 \
    libsnmp30 \
    libargon2-0 \
    libargon2-0-dev \
    liblmdb-dev \
    libsodium-dev \
    libsodium23 \
    libtommath1 \
    libnuma1 \
    libnss-myhostname \
    liblmdb0 \
    lmdb-doc \
    #

# but keep make and g++ ... to not confuse with above list, just install again if needed
minimal_apt_get_install \
    make \
    g++ \
    libtidy5 \
    libmemcached11 \
    #

apt-get clean
apt-get -y autoremove
rm -rf \
    /var/lib/apt/lists/* \
    /root/.npm/ \
    /tmp/* \
    /var/tmp/* \
    /usr/local/src/* \
    #

rm -rf /pd_build
