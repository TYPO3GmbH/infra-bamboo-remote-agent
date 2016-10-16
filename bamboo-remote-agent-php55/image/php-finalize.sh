#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## This script is to be run after php.sh.

## Install common tools
minimal_apt_get_install \
  graphicsmagick \
  zip \
  unzip \
  #

# Install composer
curl -sSL https://getcomposer.org/download/1.1.2/composer.phar -o /usr/bin/composer
chmod +x /usr/bin/composer
