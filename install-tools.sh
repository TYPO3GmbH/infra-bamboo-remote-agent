#!/bin/sh
set -e
dir=`dirname "$0"`
cd "$dir"

set -x
cp tools/docker-bash /usr/local/bin/
cp tools/baseimage-docker-nsenter /usr/local/bin/
mkdir -p /usr/local/share/baseimage-docker
