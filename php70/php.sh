#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

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
    libmemcached-dev \
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

# configure expects easy.h from curl in /usr/include and setting a path with-curl= does not work. link it ...
cd /usr/include
ln -s x86_64-linux-gnu/curl
# similar for gmp.h
ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

cd /usr/local/src/
curl -SL --progress-bar http://de2.php.net/distributions/php-7.0.33.tar.bz2 -o php-7.0.33.tar.bz2
tar xvf php-7.0.33.tar.bz2
cd php-7.0.33

./configure \
    --disable-short-tags \
    --enable-pcntl \
    --with-tsrm-pthreads \
    --with-mysqli=mysqlnd \
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
    --with-openssl \
    --enable-zip \
    --with-tidy \
    --with-curl \
    --enable-opcache \
    --enable-shmop \
    --enable-sysvshm \
    --enable-soap \
    --with-pdo-pgsql \
    --with-pgsql \
    --enable-intl \
    --with-gmp \
    --with-kerberos \
    --with-imap \
    --with-imap-ssl \
    #

make -j 10
make install


cp /usr/local/src/php-7.0.33/php.ini-development /usr/local/lib/php.ini

# Restrict cli based php.ini settings for php -S web server to have sane values in acceptance tests
sed -i s/'max_execution_time = 30'/'max_execution_time = 240'/ /usr/local/lib/php.ini
sed -i s/'; max_input_vars = 1000'/'max_input_vars = 1500'/ /usr/local/lib/php.ini

# more memory
sed -i s/'memory_limit = 128M'/'memory_limit = 2G'/ /usr/local/lib/php.ini
# Enable phar writing for packaging tasks
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /usr/local/lib/php.ini
# default timezone
sed -i s/';date.timezone ='/'date.timezone = UTC'/ /usr/local/lib/php.ini
# hint for default socket
sed -i s%'mysqli.default_socket ='%'mysqli.default_socket = /var/run/mysqld/mysqld.sock'% /usr/local/lib/php.ini

echo 'zend_extension=opcache.so' >> /usr/local/lib/php.ini

# phpredis
cd /usr/local/src
git clone https://github.com/phpredis/phpredis.git
cd phpredis
phpize
./configure
make && make install
echo 'extension=redis.so' >> /usr/local/lib/php.ini

# memcached (not memcache)
cd /usr/local/src
git clone https://github.com/php-memcached-dev/php-memcached.git
cd php-memcached
phpize
./configure
make && make install
echo 'extension=memcached.so' >> /usr/local/lib/php.ini

# xdebug
pecl install xdebug
echo 'zend_extension=xdebug.so' >> /usr/local/lib/php.ini
echo "xdebug.max_nesting_level = 400" >> /usr/local/lib/php.ini

# apcu
echo '' | pecl install apcu
echo 'extension=apcu.so' >> /usr/local/lib/php.ini
# Enable apc on cli for unit tests
echo "apc.enable_cli=1" >> /usr/local/lib/php.ini
echo "apc.slam_defense=0" >> /usr/local/lib/php.ini

# mssql driver
ACCEPT_EULA=Y minimal_apt_get_install \
    msodbcsql17 \
    mssql-tools \
    unixodbc-dev \
    #
pecl install sqlsrv-5.3.0
pecl install pdo_sqlsrv-5.3.0
echo extension=sqlsrv.so >> /usr/local/lib/php.ini
echo extension=pdo_sqlsrv.so >> /usr/local/lib/php.ini

# Prepare an additional php.ini file that does *NOT* include xdebug
# can be used with:  php -n -c /etc/php/cli-no-xdebug/php.ini
mkdir /etc/php/cli-no-xdebug/
php -i | \
    grep "\.ini" | \
    grep -o -e '\(/[A-Za-z0-9._-]\+\)\+\.ini' | \
    grep -v xdebug | \
    xargs awk 'FNR==1{print ""}1' | \
    grep -v 'zend_extension=xdebug.so' | \
    grep -v '^;' | \
    grep -v '^$' > /etc/php/cli-no-xdebug/php.ini

# Install composer
curl -sSL https://getcomposer.org/download/1.6.3/composer.phar -o /usr/bin/composer
chmod +x /usr/bin/composer
