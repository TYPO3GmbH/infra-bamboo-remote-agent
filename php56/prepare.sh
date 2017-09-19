#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Install common packages
minimal_apt_get_install \
  ack-grep \
  openssh-client \
  bzip2 \
  curl \
  git \
  language-pack-de \
  language-pack-en \
  openjdk-8-jre-headless \
  parallel \
  #

# git-cherry-pick
curl -Lo /usr/bin/gerrit-cherry-pick https://review.typo3.org/tools/bin/gerrit-cherry-pick
chmod +x /usr/bin/gerrit-cherry-pick

## Create a user for the bamboo agent.
addgroup --gid 9999 bamboo
adduser --uid 9999 --gid 9999 --disabled-password --gecos "Bamboo Remote Agent" bamboo
