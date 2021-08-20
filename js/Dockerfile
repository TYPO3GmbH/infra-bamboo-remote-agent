FROM node:14-alpine
MAINTAINER TYPO3 GmbH <info@typo3.com>

RUN apk add --no-cache \
    # gifsicle ...
    autoconf \
    automake \
    gcc \
    make \
    musl-dev \
    # runTest.sh -s checkGruntClean needs git
    git \
    && npm install -g --force yarn
