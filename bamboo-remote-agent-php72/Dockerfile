FROM typo3gmbh/php72:2.0
MAINTAINER TYPO3 GmbH <info@typo3.com>

ADD . /pd_build

RUN /pd_build/bamboo-agent.sh && \
    /pd_build/finalize.sh
