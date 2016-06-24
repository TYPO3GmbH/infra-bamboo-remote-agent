#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## This script is to be run after php7.0.sh.

## Install common tools
minimal_apt_get_install \
  graphicsmagick \
  zip \
  unzip \
  #
