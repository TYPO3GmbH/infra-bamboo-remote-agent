NAME_BASEIMAGE = typo3gmbh/baseimage
MAJOR_BASEIMAGE=1
MINOR_BASEIMAGE=0
PATCHLEVEL_BASEIMAGE=1
FULLVERSION_BASEIMAGE=$(MAJOR_BASEIMAGE).$(MINOR_BASEIMAGE).$(PATCHLEVEL_BASEIMAGE)
SHORTVERSION_BASEIMAGE=$(MAJOR_BASEIMAGE).$(MINOR_BASEIMAGE)

NAME_BAMBOO_PHP55 = typo3gmbh/bamboo-remote-agent-php55
MAJOR_BAMBOO_PHP55=1
MINOR_BAMBOO_PHP55=0
PATCHLEVEL_BAMBOO_PHP55=2
FULLVERSION_BAMBOO_PHP55=$(MAJOR_BAMBOO_PHP55).$(MINOR_BAMBOO_PHP55).$(PATCHLEVEL_BAMBOO_PHP55)
SHORTVERSION_BAMBOO_PHP55=$(MAJOR_BAMBOO_PHP55).$(MINOR_BAMBOO_PHP55)

NAME_BAMBOO_PHP56 = typo3gmbh/bamboo-remote-agent-php56
MAJOR_BAMBOO_PHP56=1
MINOR_BAMBOO_PHP56=0
PATCHLEVEL_BAMBOO_PHP56=2
FULLVERSION_BAMBOO_PHP56=$(MAJOR_BAMBOO_PHP56).$(MINOR_BAMBOO_PHP56).$(PATCHLEVEL_BAMBOO_PHP56)
SHORTVERSION_BAMBOO_PHP56=$(MAJOR_BAMBOO_PHP56).$(MINOR_BAMBOO_PHP56)

NAME_BAMBOO_PHP70 = typo3gmbh/bamboo-remote-agent-php70
MAJOR_BAMBOO_PHP70=1
MINOR_BAMBOO_PHP70=0
PATCHLEVEL_BAMBOO_PHP70=14
FULLVERSION_BAMBOO_PHP70=$(MAJOR_BAMBOO_PHP70).$(MINOR_BAMBOO_PHP70).$(PATCHLEVEL_BAMBOO_PHP70)
SHORTVERSION_BAMBOO_PHP70=$(MAJOR_BAMBOO_PHP70).$(MINOR_BAMBOO_PHP70)

NAME_BAMBOO_PHP71 = typo3gmbh/bamboo-remote-agent-php71
MAJOR_BAMBOO_PHP71=1
MINOR_BAMBOO_PHP71=0
PATCHLEVEL_BAMBOO_PHP71=6
FULLVERSION_BAMBOO_PHP71=$(MAJOR_BAMBOO_PHP71).$(MINOR_BAMBOO_PHP71).$(PATCHLEVEL_BAMBOO_PHP71)
SHORTVERSION_BAMBOO_PHP71=$(MAJOR_BAMBOO_PHP71).$(MINOR_BAMBOO_PHP71)


.PHONY: \
	all \
	build \
	build_baseimage \
	build_bamboo_php55 \
	build_bamboo_php56 \
	build_bamboo_php70 \
	build_bamboo_php71 \
	release \
	release_baseimage \
	release_bamboo_php55 \
	release_bamboo_php56 \
	release_bamboo_php70 \
	release_bamboo_php71 \
	clean \
	clean_baseimage \
	clean_bamboo_php55 \
	clean_bamboo_php56 \
	clean_bamboo_php70 \
	clean_bamboo_php71 \
	clean_images \
	clean_images_baseimage \
	clean_images_bamboo_php55 \
	clean_images_bamboo_php56 \
	clean_images_bamboo_php70 \
	clean_images_bamboo_php71


all: \
	build


build: \
	build_baseimage \
	build_bamboo_php55 \
	build_bamboo_php56 \
	build_bamboo_php70 \
	build_bamboo_php71


release: \
	release_baseimage \
	release_bamboo_php55 \
	release_bamboo_php56 \
	release_bamboo_php70 \
	release_bamboo_php71


clean: \
	clean_baseimage \
	clean_bamboo_php55 \
	clean_bamboo_php56 \
	clean_bamboo_php70 \
	clean_bamboo_php71


clean_images: \
	clean_images_baseimage \
	clean_images_bamboo_php55 \
	clean_images_bamboo_php56 \
	clean_images_bamboo_php70 \
	clean_images_bamboo_php71


build_baseimage:
	rm -rf build_baseimage
	cp -pR baseimage build_baseimage
	docker build -t $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) build_baseimage
	docker tag $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) $(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE)

release_baseimage:
	@if ! docker images $(NAME_BASEIMAGE) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_BASEIMAGE); then \
		echo "$(NAME_BASEIMAGE) version $(FULLVERSION_BASEIMAGE) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) $(NAME_BASEIMAGE):latest
	docker push $(NAME_BASEIMAGE):latest
	docker push $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE)
	docker push $(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE)

clean_baseimage:
	rm -rf build_baseimage

clean_images_baseimage:
	docker rmi $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) || true
	docker rmi $(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE) || true
	docker rmi $(NAME_BASEIMAGE):latest || true


build_bamboo_php55:
	rm -rf build_bamboo-php55
	cp -pR bamboo-remote-agent-php55 build_bamboo-php55
	echo system.imageVersion=$(FULLVERSION_BAMBOO_PHP55) >> build_bamboo-php55/config/bamboo/bamboo-capabilities.properties
	docker build -t $(NAME_BAMBOO_PHP55):$(FULLVERSION_BAMBOO_PHP55) build_bamboo-php55

release_bamboo_php55:
	@if ! docker images $(NAME_BAMBOO_PHP55) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_BAMBOO_PHP55); then \
		echo "$(NAME_BAMBOO_PHP55) version $(FULLVERSION_BAMBOO_PHP55) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_BAMBOO_PHP55):$(FULLVERSION_BAMBOO_PHP55) $(NAME_BAMBOO_PHP55):$(SHORTVERSION_BAMBOO_PHP55)
	docker tag $(NAME_BAMBOO_PHP55):$(FULLVERSION_BAMBOO_PHP55) $(NAME_BAMBOO_PHP55):latest
	docker push $(NAME_BAMBOO_PHP55):latest
	docker push $(NAME_BAMBOO_PHP55):$(FULLVERSION_BAMBOO_PHP55)
	docker push $(NAME_BAMBOO_PHP55):$(SHORTVERSION_BAMBOO_PHP55)

clean_bamboo_php55:
	rm -rf build_bamboo-php55

clean_images_bamboo_php55:
	docker rmi $(NAME_BAMBOO_PHP55):latest || true
	docker rmi $(NAME_BAMBOO_PHP55):$(SHORTVERSION_BAMBOO_PHP55) || true
	docker rmi $(NAME_BAMBOO_PHP55):$(FULLVERSION_BAMBOO_PHP55) || true


build_bamboo_php56:
	rm -rf build_bamboo-php56
	cp -pR bamboo-remote-agent-php56 build_bamboo-php56
	echo system.imageVersion=$(FULLVERSION_BAMBOO_PHP56) >> build_bamboo-php56/config/bamboo/bamboo-capabilities.properties
	docker build -t $(NAME_BAMBOO_PHP56):$(FULLVERSION_BAMBOO_PHP56) build_bamboo-php56

release_bamboo_php56:
	@if ! docker images $(NAME_BAMBOO_PHP56) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_BAMBOO_PHP56); then \
		echo "$(NAME_BAMBOO_PHP56) version $(FULLVERSION_BAMBOO_PHP56) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_BAMBOO_PHP56):$(FULLVERSION_BAMBOO_PHP56) $(NAME_BAMBOO_PHP56):$(SHORTVERSION_BAMBOO_PHP56)
	docker tag $(NAME_BAMBOO_PHP56):$(FULLVERSION_BAMBOO_PHP56) $(NAME_BAMBOO_PHP56):latest
	docker push $(NAME_BAMBOO_PHP56):latest
	docker push $(NAME_BAMBOO_PHP56):$(FULLVERSION_BAMBOO_PHP56)
	docker push $(NAME_BAMBOO_PHP56):$(SHORTVERSION_BAMBOO_PHP56)

clean_bamboo_php56:
	rm -rf build_bamboo-php56

clean_images_bamboo_php56:
	docker rmi $(NAME_BAMBOO_PHP56):latest || true
	docker rmi $(NAME_BAMBOO_PHP56):$(SHORTVERSION_BAMBOO_PHP56) || true
	docker rmi $(NAME_BAMBOO_PHP56):$(FULLVERSION_BAMBOO_PHP56) || true


build_bamboo_php70:
	rm -rf build_bamboo-php70
	cp -pR bamboo-remote-agent-php70 build_bamboo-php70
	echo system.imageVersion=$(FULLVERSION_BAMBOO_PHP70) >> build_bamboo-php70/config/bamboo/bamboo-capabilities.properties
	docker build -t $(NAME_BAMBOO_PHP70):$(FULLVERSION_BAMBOO_PHP70) build_bamboo-php70

release_bamboo_php70:
	@if ! docker images $(NAME_BAMBOO_PHP70) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_BAMBOO_PHP70); then \
		echo "$(NAME_BAMBOO_PHP70) version $(FULLVERSION_BAMBOO_PHP70) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_BAMBOO_PHP70):$(FULLVERSION_BAMBOO_PHP70) $(NAME_BAMBOO_PHP70):$(SHORTVERSION_BAMBOO_PHP70)
	docker tag $(NAME_BAMBOO_PHP70):$(FULLVERSION_BAMBOO_PHP70) $(NAME_BAMBOO_PHP70):latest
	docker push $(NAME_BAMBOO_PHP70):latest
	docker push $(NAME_BAMBOO_PHP70):$(FULLVERSION_BAMBOO_PHP70)
	docker push $(NAME_BAMBOO_PHP70):$(SHORTVERSION_BAMBOO_PHP70)

clean_bamboo_php70:
	rm -rf build_bamboo-php70

clean_images_bamboo_php70:
	docker rmi $(NAME_BAMBOO_PHP70):latest || true
	docker rmi $(NAME_BAMBOO_PHP70):$(SHORTVERSION_BAMBOO_PHP70) || true
	docker rmi $(NAME_BAMBOO_PHP70):$(FULLVERSION_BAMBOO_PHP70) || true


build_bamboo_php71:
	rm -rf build_bamboo-php71
	cp -pR bamboo-remote-agent-php71 build_bamboo-php71
	echo system.imageVersion=$(FULLVERSION_BAMBOO_PHP71) >> build_bamboo-php71/config/bamboo/bamboo-capabilities.properties
	docker build -t $(NAME_BAMBOO_PHP71):$(FULLVERSION_BAMBOO_PHP71) build_bamboo-php71

release_bamboo_php71:
	@if ! docker images $(NAME_BAMBOO_PHP71) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_BAMBOO_PHP71); then \
		echo "$(NAME_BAMBOO_PHP71) version $(FULLVERSION_BAMBOO_PHP71) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_BAMBOO_PHP71):$(FULLVERSION_BAMBOO_PHP71) $(NAME_BAMBOO_PHP71):$(SHORTVERSION_BAMBOO_PHP71)
	docker tag $(NAME_BAMBOO_PHP71):$(FULLVERSION_BAMBOO_PHP71) $(NAME_BAMBOO_PHP71):latest
	docker push $(NAME_BAMBOO_PHP71):latest
	docker push $(NAME_BAMBOO_PHP71):$(FULLVERSION_BAMBOO_PHP71)
	docker push $(NAME_BAMBOO_PHP71):$(SHORTVERSION_BAMBOO_PHP71)

clean_bamboo_php71:
	rm -rf build_bamboo-php71

clean_images_bamboo_php71:
	docker rmi $(NAME_BAMBOO_PHP71):latest || true
	docker rmi $(NAME_BAMBOO_PHP71):$(SHORTVERSION_BAMBOO_PHP71) || true
	docker rmi $(NAME_BAMBOO_PHP71):$(FULLVERSION_BAMBOO_PHP71) || true
