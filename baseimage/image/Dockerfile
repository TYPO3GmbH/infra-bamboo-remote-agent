FROM ubuntu:16.04
MAINTAINER TYPO3 GmbH <info@typo3.com>

ADD . /bd_build

RUN /bd_build/prepare.sh && \
	/bd_build/system_services.sh && \
	/bd_build/utilities.sh && \
	/bd_build/cleanup.sh

CMD ["/sbin/my_init"]
