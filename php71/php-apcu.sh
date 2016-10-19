#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
	make \
	php7.1-dev \
	#

cd /usr/local/src/

git clone https://github.com/krakjoe/apcu.git
cd apcu
phpize
./configure
make
make install
cd ../

git clone https://github.com/krakjoe/apcu-bc.git
cd apcu-bc
phpize
./configure
make
make install

echo "extension=apcu.so" > /etc/php/7.1/mods-available/apcu.ini
echo "apc.enable_cli=1" >> /etc/php/7.1/mods-available/apcu.ini
echo "apc.slam_defense=0" >> /etc/php/7.1/mods-available/apcu.ini
echo "extension=apc.so" > /etc/php/7.1/mods-available/apc.ini

ln -s /etc/php/7.1/mods-available/apcu.ini /etc/php/7.1/cli/conf.d/20-apcu.ini

# apc-bc module must be loaded *after* apcu, have a higher integer in front to enforce this
ln -s /etc/php/7.1/mods-available/apc.ini /etc/php/7.1/cli/conf.d/21-apc.ini
