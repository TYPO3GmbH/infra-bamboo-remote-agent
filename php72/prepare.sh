#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Install common packages
minimal_apt_get_install \
  openssh-client \
  git \
  language-pack-de \
  language-pack-en \
  openjdk-8-jre-headless \
  parallel \
  docker.io \
  docker-compose \
  #

# git-cherry-pick
curl -Lo /usr/bin/gerrit-cherry-pick https://review.typo3.org/tools/bin/gerrit-cherry-pick
chmod +x /usr/bin/gerrit-cherry-pick
