#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
  php5.5 \
  php5.5-bcmath \
  php5.5-bz2 \
  php5.5-cli \
  php5.5-common \
  php5.5-curl \
  php5.5-gd \
  php5.5-gmp \
  php5.5-imap \
  php5.5-intl \
  php5.5-json \
  php5.5-mbstring \
  php5.5-mcrypt \
  php5.5-mysql \
  php5.5-opcache \
  php5.5-pgsql \
  php5.5-pspell \
  php5.5-readline \
  php5.5-recode \
  php5.5-sqlite3 \
  php5.5-xml \
  php5.5-xmlrpc \
  php5.5-xsl \
  php5.5-zip \
  php-redis \
  php-memcached \
  php-xdebug \
  #

## Enable phar writing
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /etc/php/5.5/cli/php.ini

/pd_build/php-finalize.sh
