#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
  php5.6 \
  php5.6-bcmath \
  php5.6-bz2 \
  php5.6-cli \
  php5.6-common \
  php5.6-curl \
  php5.6-gd \
  php5.6-gmp \
  php5.6-imap \
  php5.6-intl \
  php5.6-json \
  php5.6-mbstring \
  php5.6-mcrypt \
  php5.6-mysql \
  php5.6-opcache \
  php5.6-pgsql \
  php5.6-pspell \
  php5.6-readline \
  php5.6-recode \
  php5.6-sqlite3 \
  php5.6-xml \
  php5.6-xmlrpc \
  php5.6-xsl \
  php5.6-zip \
  php-redis \
  php-memcached \
  php-xdebug \
  #

## Enable phar writing
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /etc/php/5.6/cli/php.ini

## Install common tools
minimal_apt_get_install \
  graphicsmagick \
  imagemagick \
  zip \
  unzip \
  #

# Install composer
curl -sSL https://getcomposer.org/download/1.3.1/composer.phar -o /usr/bin/composer
chmod +x /usr/bin/composer
