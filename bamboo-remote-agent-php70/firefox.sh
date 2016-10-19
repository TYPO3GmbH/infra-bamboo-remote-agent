#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# xvfb and some hard dependencies of firefox
minimal_apt_get_install \
  xvfb \
  libxcomposite1 \
  libasound2 \
  libgtk2.0-0 \
  #

curl -SL --progress-bar https://ftp.mozilla.org/pub/firefox/releases/45.4.0esr/linux-x86_64/en-US/firefox-45.4.0esr.tar.bz2 -o /tmp/firefox.tar.bz2
tar xv -C /opt/ -f /tmp/firefox.tar.bz2
ln -s /opt/firefox/firefox /usr/bin/firefox

mkdir /tmp/.X11-unix
chmod 1777 /tmp/.X11-unix
chown root /tmp/.X11-unix/