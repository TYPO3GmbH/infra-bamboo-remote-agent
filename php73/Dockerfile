FROM ghcr.io/typo3gmbh/baseimage:3.0.18
MAINTAINER TYPO3 GmbH <info@typo3.com>

ADD . /pd_build

RUN /pd_build/enable_repos.sh && \
    /pd_build/nodejs.sh && \
    /pd_build/php.sh && \
    /pd_build/finalize.sh

# Install composer latest
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
