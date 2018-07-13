FROM typo3gmbh/baseimage:3.0
MAINTAINER TYPO3 GmbH <info@typo3.com>

ADD . /pd_build

RUN /pd_build/bamboo-agent.sh && \
    /pd_build/utilities.sh && \
    /pd_build/finalize.sh
