#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# We don't know which user will execute bamboo, we have to use 777 here
mkdir -p /srv/bamboo/bin
chmod 0777 /srv/bamboo
chmod 0777 /srv/bamboo/bin

# Download bamboo remote agent
curl -SL --progress-bar https://bamboo.typo3.com/agentServer/agentInstaller/ -o /srv/bamboo-installer.jar

# Configure properties
cp -a /pd_build/config/bamboo-capabilities.properties /srv/bamboo/bin

# Enable agent
cp -a /pd_build/runit/bamboo-agent /etc/service/bamboo-agent
chmod 777 /etc/service/bamboo-agent