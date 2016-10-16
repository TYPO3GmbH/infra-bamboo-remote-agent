# A minimal Ubuntu base image modified for Docker-friendliness

typo3gmbh/baseimage is a docker image based off of Phusion's baseimage-docker, but has been
modified to run on Ubuntu 16.04 and removes features deemed unnecessary for a modern baseimage.

Baseimage-docker is a special [Docker](https://www.docker.com) image that is configured for
correct use within Docker containers. It is Ubuntu, plus:

 * Modifications for Docker-friendliness.
 * Administration tools that are especially useful in the context of Docker.
 * Mechanisms for easily running multiple processes, [without violating the Docker philosophy](#docker_single_process).

You can use it as a base for your own Docker images. At typo3-gmbh this image is used as base of
the [php test images](https://bitbucket.typo3.com/projects/T3COM/repos/bamboo-remote-agent/browse) to execute
TYPO3 CMS core tests.

baseimage-docker is available for pulling from [the Docker registry](https://registry.hub.docker.com/u/typo3gmbh/baseimage/).

The image scripts can be found at [typo3.com-bitbucket](https://bitbucket.typo3.com/projects/T3COM/repos/baseimage-docker/browse).

This image is a fork from [passenger-docker](https://github.com/phusion/passenger-docker).
