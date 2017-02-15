#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Install MariaDB
minimal_apt_get_install \
  postgresql \
  #
