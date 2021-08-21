# A set of Docker containers for TYPO3 testing infrastructure


## Introduction

This [repository](https://github.com/TYPO3GmbH/infra-bamboo-remote-agent) contains
Docker container build scripts used within the [TYPO3 GmbH](https://typo3.com) infrastructure
to execute the TYPO3 CMS core tests and other build and packaging jobs.

The containers may be used by anyone to execute tests locally in order to have the exact
same environment as the "pre-merge tests" run for the TYPO3 CMS core.

The latest compiled versions of those containers can be pulled from [Docker Hub](https://hub.docker.com/r/typo3gmbh/) or from [Github Container Registry](https://github.com/orgs/TYPO3GmbH/packages).


## Architecture

Docker containers can be stacked: An image can use another image below to build its
own stuff on-top of that. This feature is used here.


### phpXY

Images on top of php:X.X-cli. The images contain php in one version per container and
some other packages like graphicsmagick.

---
Future versions of the PHP images will be based on php:X.X-alpine.

---

* Single images per PHP version. There is an image coming with PHP 7.0 and an image for PHP 7.1 and so on.

Users can use these images to execute unit, functional and acceptance tests in an environment that is
identical to the core testing infrastructure. Note that some core tests need additional containers that
run a database or selenium with chrome.


### js

The js images are built on top of node:XX-alpine, containing yarn and Chromium. This image is used for JavaScript unit
tests and some basic linting in the npm area.


## Compiling and Uploading

A Makefile takes care of container building. One obvious reason to re-compile is when
container definitions have changed or added, another one is to have builds with younger
packages (eg. younger php versions). To create a new set of containers, these steps should be done:

* Prepare new semver versions in Makefile (and commit/push change): Each container has an own
  version, raise at least the patch level.
* If files in one of the version directories get changed, the corresponding version is built automatically by Github
  - version information is taken from the Makefile.

### New Base Image Release

If you want to use a new base image, adjust the base image version in all Dockerfiles. The change detection will then
take care of rebuilding the corresponding images.

## Manually Compiling and uploading

To create a new set of containers manually, these steps should be done:

* Pick a machine that has good network connectivity and a young docker engine installed.
* Drop all containers (docker rmi) that are involved in the build: alpine, node, php-cli,
  phpXY builds and js builds. This forces docker to fetch / compile fresh versions of
  everything.
* Prepare new semver versions in Makefile (and commit/push change): Each container has an own
  version, raise at least the patch level.
* 'make build' will build all containers a-new. The php containers can be built in parallel,
  this will drastically increase build server load, but reduce time. A 'make -j8 build' would build
  8 php containers in parallel.
* 'make release' will add tags and push to docker hub. It will ask for according credentials.
   If it doesn't, but reject the push' run 'docker login docker.io' and log in with the credentials from LastPass.


## Packages Included

### PHP Images

The images are based on Debian. The package `docker-php-extension-installer` is installed to ease the installation of
additional PHP modules, which are compiled from their sources. The following modules are installed:

 * apcu
 * bcmath
 * bz2
 * @composer-2
 * gd
 * gettext
 * gmp
 * intl
 * memcached
 * mysqli
 * opcache
 * pdo_mysql
 * pdo_pgsql
 * pdo_sqlsrv
 * pgsql
 * pspell
 * redis
 * soap
 * sqlsrv
 * sysvsem
 * xdebug-^2.8 (this will change with newer versions)
 * zip


### JS Image

The JavaScript image is based on node and contains yarn and Chromium in addition.
