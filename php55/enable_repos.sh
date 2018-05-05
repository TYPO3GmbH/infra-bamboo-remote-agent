#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

apt-get update

# NodeSource's Node.js repository
# disabled with switch to ubuntu 18.04 base
# curl --fail -sL https://deb.nodesource.com/setup_8.x | bash -

# Set a hard IP for some typo3.org services for now until maybe anytime server team decides
# to get DNS right again
echo "136.243.44.172 review.typo3.org" >> /etc/hosts
echo "136.243.44.172 git. typo3.org" >> /etc/hosts