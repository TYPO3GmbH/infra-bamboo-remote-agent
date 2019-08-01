# A set of Docker containers for TYPO3 testing infrastructure


## Introduction

This [repository](https://bitbucket.typo3.com/projects/T3COM/repos/bamboo-remote-agent/browse) contains
Docker container build scripts used within the [TYPO3 GmbH](https://typo3.com) infrastructure
to execute the TYPO3 CMS core tests and other build and packaging jobs.

The containers may be used by anyone to execute tests locally in order to have the exact
same environment as the "pre-merge tests" run for the TYPO3 CMS core.

The latest compiled versions of those containers can be pulled from [Docker Hub](https://hub.docker.com/r/typo3gmbh/).


## Architecture

Docker containers can be stacked: An image can use another image below to build its
own stuff on-top of that. This feature is used here.


### baseimage: A minimal Ubuntu base image modified for Docker-friendliness

This is the lowest layer of images put on top of each other.

typo3gmbh/baseimage is a Docker image based off of Phusion's baseimage-docker, but has been
modified to run on Ubuntu 18.04 and removes features deemed unnecessary for a modern baseimage.

baseimage is a special [Docker](https://www.docker.com) image that is configured for
correct use within Docker containers. It is Ubuntu, plus:

 * Modifications for Docker-friendliness.
 * Administration tools that are especially useful in the context of Docker.

baseimage is a fork from [passenger-docker](https://github.com/phusion/passenger-docker).


### phpXY

Images on top of baseimage. The images contain php in one version per container, nodejs and
some other packages like graphicsmagick.

* Single images per PHP version. There is an image coming with PHP 7.0 and an image for PHP 7.1 and so on.

Users can use these images to execute unit, functional, acceptance and JS tests in an environment that is
identical to the core testing infrastructure. Note that some core tests need additional containers that
run a database or selenium with chrome.


### bamboo-remote-agent

typo3gmbh/bamboo-remote-agent adds the bamboo test runner on top of the baseimage images for integration in
TYPO3 GmbH testing infrastructure. Users usually don't have to deal with these images and use the phpXY ones instead.


## Compiling and uploading

A Makefile takes care of container building. One obvious reason to re-compile is when
container definitions have changed or added, another one is to have builds with younger
packages (eg. younger php versions). To create a new set of containers, these steps should be done:

* Pick a machine that has good network connectivity and a young docker engine installed.
* Drop all containers (docker rmi) that are involved in the build: the ubuntu 18.04 one, baseimage,
  phpXY bulids and agent build. This forces docker to fetch / compile fresh versions of
  everything.
* Prepare new semver versions in Makefile (and commit/push change): Each container has an own
  version, raise at least the patch level.
* 'make build' will build all containers a-new. The php containers can be built in parallel,
  this will drastically increase build server load, but reduce time. A 'make -j8 build' would build
  8 php containers in parallel, after baseimage has been built.
* 'make release' will add tags and push to docker hub. It will ask for according credentials.
 