#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Install init process.
cp /pd_build/bin/my_init /sbin/
mkdir -p /etc/my_init.d

mkdir -p /etc/container_environment
touch /etc/container_environment.sh
touch /etc/container_environment.json
chmod 700 /etc/container_environment

groupadd -g 8377 docker_env
chown :docker_env /etc/container_environment.sh /etc/container_environment.json
chmod 640 /etc/container_environment.sh /etc/container_environment.json
ln -s /etc/container_environment.sh /etc/profile.d/

# Install runit.
minimal_apt_get_install runit
