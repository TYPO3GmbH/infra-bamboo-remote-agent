FROM ubuntu:18.04
MAINTAINER TYPO3 GmbH <info@typo3.com>
# last update 28.04. (base)

ADD . /pd_build

RUN /pd_build/prepare.sh && \
    /pd_build/utilities.sh && \
    /pd_build/cleanup.sh
