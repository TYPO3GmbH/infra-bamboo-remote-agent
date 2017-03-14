#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
  build-essential \
  php-apcu \
  php7.0 \
  php7.0-bcmath \
  php7.0-bz2 \
  php7.0-cli \
  php7.0-common \
  php7.0-curl \
  php7.0-dev \
  php7.0-gd \
  php7.0-gmp \
  php7.0-imap \
  php7.0-intl \
  php7.0-json \
  php7.0-mbstring \
  php7.0-mcrypt \
  php7.0-mysql \
  php7.0-opcache \
  php7.0-pgsql \
  php7.0-pspell \
  php7.0-readline \
  php7.0-recode \
  php7.0-sqlite3 \
  php7.0-xml \
  php7.0-xmlrpc \
  php7.0-xsl \
  php7.0-zip \
  php-redis \
  php-memcached \
  php-xdebug \
  php-pear \
  #

## Enable phar writing
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /etc/php/7.0/cli/php.ini

# mssql driver
pecl install sqlsrv
echo extension=sqlsrv.so >> /etc/php/7.0/mods-available/sqlsrv.ini
phpenmod sqlsrv

/pd_build/php-finalize.sh
