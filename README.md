# A set of Docker containers for TYPO3 testing infrastructure


## Introduction

This [repository](https://bitbucket.typo3.com/projects/T3COM/repos/baseimage-docker/browse) contains
Docker container build scripts used within the [TYPO3 GmbH](https://typo3.com) infrastructure
to execute the TYPO3 CMS core tests and other build and packaging jobs.

The containers may be used by anyone to execute tests locally in order to have the exact
same environment as the "pre-merge tests" run for the TYPO3 CMS core.

The latest compiled versions of those containers can be pulled from [Docker Hub](https://hub.docker.com/r/typo3gmbh/).

Docker containers can be stacked: An image can use another image below to build its
own stuff on-top of that. This feature is used here.


## baseimage: A minimal Ubuntu base image modified for Docker-friendliness

This is the lowest layer of images put on top of each other.

typo3gmbh/baseimage is a Docker image based off of Phusion's baseimage-docker, but has been
modified to run on Ubuntu 16.04 and removes features deemed unnecessary for a modern baseimage.

baseimage is a special [Docker](https://www.docker.com) image that is configured for
correct use within Docker containers. It is Ubuntu, plus:

 * Modifications for Docker-friendliness.
 * Administration tools that are especially useful in the context of Docker.
 * Mechanisms for easily running multiple processes, [without violating the Docker philosophy](#docker_single_process).

baseimage is a fork from [passenger-docker](https://github.com/phusion/passenger-docker).


## bamboo-remote-agent-phpXY

typo3gmbh/bamboo-remote-agent-phpXY add PHP and other stuff on top of the baseimage. One container
per supported PHP version is built.