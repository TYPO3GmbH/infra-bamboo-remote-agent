#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Create bamboo work directory
mkdir -p /srv/bamboo-agent-home
chmod 0775 /srv/bamboo-agent-home
chown bamboo:bamboo /srv/bamboo-agent-home

# Install bamboo remote agent
curl -SL --progress-bar https://bamboo.typo3.com/agentServer/agentInstaller/atlassian-bamboo-agent-installer-5.14.1.jar -o /tmp/bamboo-installer.jar
/usr/bin/java -Dbamboo.home=/srv/bamboo-agent-home -jar /tmp/bamboo-installer.jar https://bamboo.typo3.com/agentServer install
chown -R bamboo:bamboo /srv/bamboo-agent-home
rm -f /tmp/bamboo-installer.jar

## Configure properties
cp -a /pd_build/config/bamboo/bamboo-capabilities.properties /srv/bamboo-agent-home/bin

## Enable agent
cp -a /pd_build/runit/bamboo-agent /etc/service/bamboo-agent
