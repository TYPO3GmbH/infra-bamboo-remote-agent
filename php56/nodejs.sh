#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Install Node.js
minimal_apt_get_install nodejs

## And update nodejs on global level
npm update -g