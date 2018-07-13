FROM ubuntu:18.04
MAINTAINER TYPO3 GmbH <info@typo3.com>

ADD . /pd_build

RUN /pd_build/prepare.sh && \
    /pd_build/utilities.sh && \
    /pd_build/cleanup.sh
