#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

/pd_build/enable_repos.sh
/pd_build/prepare.sh
/pd_build/bamboo-agent.sh
/pd_build/mysql.sh
/pd_build/nginx.sh
/pd_build/redis-server.sh
/pd_build/nodejs.sh

if [[ "$php70" = 1 ]]; then /pd_build/php7.0.sh; fi

/pd_build/finalize.sh
