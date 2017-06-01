#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Install Node.js and some packages to successfully compile stuff
minimal_apt_get_install nodejs make g++

# And update npm afterwards
npm install npm -g