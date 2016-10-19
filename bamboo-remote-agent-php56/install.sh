#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

/pd_build/prepare.sh
/pd_build/bamboo-agent.sh
/pd_build/finalize.sh
