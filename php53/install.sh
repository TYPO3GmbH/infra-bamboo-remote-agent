#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

/pd_build/prepare.sh
/pd_build/mysql.sh
/pd_build/redis-server.sh
/pd_build/memcached.sh
/pd_build/nodejs.sh
#/pd_build/php.sh

/pd_build/finalize.sh
