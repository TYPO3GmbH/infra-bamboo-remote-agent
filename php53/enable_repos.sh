#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## NodeSource's Node.js repository
curl --fail -sL https://deb.nodesource.com/setup_4.x | bash -
