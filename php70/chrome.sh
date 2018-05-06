#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# some hard dependencies of chrome / chromedriver
minimal_apt_get_install \
    libgconf2-4 \
    google-chrome-stable \
    #
