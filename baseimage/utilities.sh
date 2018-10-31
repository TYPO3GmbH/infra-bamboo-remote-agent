#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Often used tools.
$minimal_apt_get_install \
    curl \
    less \
    vim \
    psmisc \
    net-tools \
    iputils-ping \
    ncdu \
    dirmngr \
    gpg-agent \
    ack-grep \
    bzip2 \
    pbzip2 \
    patch \
    openssh-client \
    git \
    language-pack-de \
    parallel \
    netcat \
    #
