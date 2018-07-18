#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Often used tools.
minimal_apt_get_install \
    openjdk-8-jre-headless \
    docker.io \
    docker-compose \
    #

# git-cherry-pick
curl -Lo /usr/bin/gerrit-cherry-pick https://review.typo3.org/tools/bin/gerrit-cherry-pick
chmod +x /usr/bin/gerrit-cherry-pick
