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
