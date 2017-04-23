#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

/pd_build/enable_repos.sh
/pd_build/prepare.sh
/pd_build/mysql.sh
/pd_build/postgres.sh
/pd_build/mssql.sh
/pd_build/redis-server.sh
/pd_build/memcached.sh
/pd_build/nodejs.sh
/pd_build/php.sh
/pd_build/chrome.sh
/pd_build/firefox.sh

/pd_build/finalize.sh
