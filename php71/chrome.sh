#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# xvfb and some hard dependencies of chrome
minimal_apt_get_install \
  google-chrome-stable \
  #
