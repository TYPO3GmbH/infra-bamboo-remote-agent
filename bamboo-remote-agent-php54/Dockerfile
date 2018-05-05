FROM typo3gmbh/php54:2.0
MAINTAINER TYPO3 GmbH <info@typo3.com>

ADD . /pd_build
RUN /pd_build/install.sh
CMD ["/sbin/my_init"]
