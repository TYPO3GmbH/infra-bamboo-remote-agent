FROM node:14
MAINTAINER TYPO3 GmbH <info@typo3.com>
# Updated on 04.12.2020

ADD . /pd_build

RUN /pd_build/enable_repos.sh && \
    /pd_build/nodejs.sh && \
    /pd_build/finalize.sh
