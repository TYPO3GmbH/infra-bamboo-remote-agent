#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
  make \
  php-apcu \
  php-apcu-bc \
  php7.1 \
  php7.1-bcmath \
  php7.1-bz2 \
  php7.1-cli \
  php7.1-common \
  php7.1-curl \
  php7.1-dev \
  php7.1-gd \
  php7.1-gmp \
  php7.1-imap \
  php7.1-intl \
  php7.1-json \
  php7.1-mbstring \
  php7.1-mcrypt \
  php7.1-mysql \
  php7.1-opcache \
  php7.1-pgsql \
  php7.1-pspell \
  php7.1-readline \
  php7.1-recode \
  php7.1-sqlite3 \
  php7.1-xml \
  php7.1-xmlrpc \
  php7.1-xsl \
  php7.1-zip \
  php-redis \
  php-memcached \
  php-xdebug \
  re2c \

  #

## Enable phar writing
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /etc/php/7.1/cli/php.ini

## Install common tools
minimal_apt_get_install \
  graphicsmagick \
  zip \
  unzip \
  #

# Install composer
curl -sSL https://getcomposer.org/download/1.3.1/composer.phar -o /usr/bin/composer
chmod +x /usr/bin/composer

