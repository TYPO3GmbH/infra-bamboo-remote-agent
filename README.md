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
 * Mechanisms for easily running multiple processes, without violating the Docker philosophy.

baseimage is a fork from [passenger-docker](https://github.com/phusion/passenger-docker).


### phpXY

Images on top of baseimage. The images are "all-in-one" container that contain both PHP as well as
various daemons and databases at the same time.

* Single images per PHP version. There is an image coming with PHP 7.0 and an image for PHP 7.1 and so on.
* The images package and start a mariaDB, a PostgreSQL, and have sqlite3 installed.
* Various other services like a memcache and a redis daemon.
* A chrome browser, used "headless" to execute acceptance tests.

Users can start these images to execute unit, functional, acceptance and JS tests in an environment that is identical
to the core testing infrastructure.

Simple usage example, executing accepance tests on a fresh core clone:

```
# fetch latest version of php72 image
docker pull typo3gmbh/php72:latest
# start a local image, start processes and get a bash on it, delete everything on container logout
docker run -it --rm typo3gmbh/php72:latest /sbin/my_init -- bash
mkdir /srv/tmp && cd /srv/tmp
git clone git://git.typo3.org/Packages/TYPO3.CMS.git .
mkdir -p  typo3temp/var/tests/
export HOME=/root typo3DatabaseName="func" typo3DatabaseUsername="funcu" typo3DatabasePassword="funcp" typo3DatabaseHost="localhost"
COMPOSER_ROOT_VERSION=9.1.0 composer install
php -S localhost:8000 >/dev/null 2>&1 &
./bin/chromedriver --url-base=/wd/hub >/dev/null 2>&1 &
./bin/codecept run Acceptance -d -c vendor/typo3/testing-framework/Resources/Core/Build/AcceptanceTests.yml
```

The images allow running mysql in a ramdisk to speed up functional tests and allows to use an already
existing local core or typo3 instance as code source.


### bamboo-remote-agent-phpXY

typo3gmbh/bamboo-remote-agent-phpXY adds the bamboo test runner on top of the phpXY images for integration in
TYPO3 GmbH testing infrastructure. Users usually don't have to deal with these images and use the phpXY ones instead.