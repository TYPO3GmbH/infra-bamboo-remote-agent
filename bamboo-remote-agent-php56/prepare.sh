#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Create a user for the bamboo agent.
addgroup --gid 9999 bamboo
adduser --uid 9999 --gid 9999 --disabled-password --gecos "Bamboo Remote Agent" bamboo
