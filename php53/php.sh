#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

cd /usr/local/src/

minimal_apt_get_install \
    graphicsmagick \
    imagemagick \
    zip \
    unzip \
    make \
    gcc \
    autoconf \
    bison \
    re2c \
    file \
    flex \
    mcrypt \
    aspell \
    bsdmainutils \
    libxpm-dev \
    libsasl2-dev \
    libpspell-dev \
    libreadline-dev \
    libaspell-dev \
    libxml2 \
    libxml2-dev \
    libbz2-dev \
    libzip-dev \
    libzip4 \
    zlib1g \
    zlib1g-dev \
    libcurl4-openssl-dev \
    libcurl4 \
    libc-client-dev \
    libfreetype6 \
    libfreetype6-dev \
    libpng16-16 \
    libpng-dev \
    libmcrypt-dev \
    libmcrypt4 \
    libtidy-dev \
    libxslt1-dev \
    krb5-multidev \
    libapparmor-dev \
    libapr1 \
    libapr1-dev \
    libaprutil1 \
    libaprutil1-dev \
    libarchive-zip-perl \
    libasprintf0v5 \
    libbsd-dev \
    libcroco3 \
    libct4 \
    libdb-dev \
    libdb5.3-dev \
    libelf1 \
    libexpat1-dev \
    libfontconfig1-dev \
    libgcrypt11-dev \
    libgcrypt20-dev \
    libgd-dev \
    libgd3 \
    libglib2.0-bin \
    libglib2.0-data \
    libglib2.0-dev \
    libgmp3-dev \
    libgpg-error-dev \
    libhunspell-1.6-0 \
    libib-util \
    libice-dev \
    libice6 \
    libjbig-dev \
    libjbig0 \
    libjpeg-dev \
    libjpeg-turbo8-dev \
    libjpeg8-dev \
    libkrb5-dev \
    libldap2-dev \
    libltdl-dev \
    libltdl7 \
    liblzma-dev \
    libmagic-dev \
    libmhash-dev \
    libmysqlclient20 \
    libmysqlclient-dev \
    libodbc1 \
    libonig-dev \
    libonig4 \
    libpcre16-3 \
    libpcre3-dev \
    libpcre32-3 \
    libpcrecpp0v5 \
    libpipeline1 \
    libpq-dev \
    libpq5 \
    libpython-stdlib \
    libpython2.7-minimal \
    libpython2.7-stdlib \
    libqdbm-dev \
    libqdbm14 \
    librecode-dev \
    librecode0 \
    libsctp-dev \
    libsctp1 \
    libsm-dev \
    libsm6 \
    libsqlite3-dev \
    libsybdb5 \
    libsystemd-dev \
    libtidy5 \
    libtiff5 \
    libtiff5-dev \
    libtiffxx5 \
    libtimedate-perl \
    libtool \
    libunistring2 \
    libvpx-dev \
    libvpx5 \
    libwebp-dev \
    libwebp6 \
    libwebpdemux2 \
    libwebpmux3 \
    libxmlrpc-epi-dev \
    libxmlrpc-epi0 \
    libxmltok1 \
    libxmltok1-dev \
    libxslt1.1 \
    libxt-dev \
    libxt6 \
    unixodbc \
    unixodbc-dev \
    uuid-dev \
    #

curl -SL --progress-bar https://www.openssl.org/source/old/0.9.x/openssl-0.9.8v.tar.gz -o openssl-0.9.8v.tar.gz
tar xvf openssl-0.9.8v.tar.gz
cd openssl-0.9.8v
./config
make -j 10
make install_sw

# configure expects easy.h from curl in /usr/include and setting a path with-curl= does not work.
# link it ...
cd /usr/include
ln -s x86_64-linux-gnu/curl

cd /usr/local/src

curl -SL --progress-bar http://de2.php.net/distributions/php-5.3.29.tar.bz2 -o php-5.3.29.tar.bz2
tar -xvf php-5.3.29.tar.bz2
cd php-5.3.29

./configure \
    --without-t1lib \
    --disable-short-tags \
    --enable-pcntl \
    --with-tsrm-pthreads \
    --with-mysqli=mysqlnd \
    --with-mysql=mysqlnd \
    --with-pdo-mysql \
    --with-zlib \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-bcmath \
    --with-bz2 \
    --enable-calendar \
    --enable-exif \
    --enable-ftp \
    --with-gd \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --with-iconv-dir \
    --with-gettext \
    --enable-mbstring \
    --with-mcrypt \
    --with-mhash \
    --with-pspell \
    --with-readline \
    --enable-soap \
    --enable-sockets \
    --enable-wddx \
    --with-xmlrpc \
    --with-xsl \
    --with-openssl=/usr/local/ssl/ \
    --enable-zip \
    --with-tidy \
    --with-curl \
    #

make -j 10
make install

cp /usr/local/src/php-5.3.29/php.ini-development /usr/local/lib/php.ini
# more memory
sed -i s/'memory_limit = 128M'/'memory_limit = 1280M'/ /usr/local/lib/php.ini
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /usr/local/lib/php.ini
sed -i s/';date.timezone ='/'date.timezone = UTC'/ /usr/local/lib/php.ini

# Install composer
curl -sSL https://getcomposer.org/download/1.9.1/composer.phar -o /usr/bin/composer
chmod +x /usr/bin/composer
