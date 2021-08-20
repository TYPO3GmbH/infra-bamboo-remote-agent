REGISTRY=ghcr.io/

NAME_BASEIMAGE = typo3gmbh/baseimage
MAJOR_BASEIMAGE=3
MINOR_BASEIMAGE=0
PATCHLEVEL_BASEIMAGE=18
FULLVERSION_BASEIMAGE=$(MAJOR_BASEIMAGE).$(MINOR_BASEIMAGE).$(PATCHLEVEL_BASEIMAGE)
SHORTVERSION_BASEIMAGE=$(MAJOR_BASEIMAGE).$(MINOR_BASEIMAGE)


NAME_PHP53 = typo3gmbh/php53
MAJOR_PHP53=3
MINOR_PHP53=0
PATCHLEVEL_PHP53=18
FULLVERSION_PHP53=$(MAJOR_PHP53).$(MINOR_PHP53).$(PATCHLEVEL_PHP53)
SHORTVERSION_PHP53=$(MAJOR_PHP53).$(MINOR_PHP53)

NAME_PHP54 = typo3gmbh/php54
MAJOR_PHP54=3
MINOR_PHP54=0
PATCHLEVEL_PHP54=18
FULLVERSION_PHP54=$(MAJOR_PHP54).$(MINOR_PHP54).$(PATCHLEVEL_PHP54)
SHORTVERSION_PHP54=$(MAJOR_PHP54).$(MINOR_PHP54)

NAME_PHP55 = typo3gmbh/php55
MAJOR_PHP55=3
MINOR_PHP55=0
PATCHLEVEL_PHP55=20
FULLVERSION_PHP55=$(MAJOR_PHP55).$(MINOR_PHP55).$(PATCHLEVEL_PHP55)
SHORTVERSION_PHP55=$(MAJOR_PHP55).$(MINOR_PHP55)

NAME_PHP56 = typo3gmbh/php56
MAJOR_PHP56=3
MINOR_PHP56=0
PATCHLEVEL_PHP56=19
FULLVERSION_PHP56=$(MAJOR_PHP56).$(MINOR_PHP56).$(PATCHLEVEL_PHP56)
SHORTVERSION_PHP56=$(MAJOR_PHP56).$(MINOR_PHP56)

NAME_PHP70 = typo3gmbh/php70
MAJOR_PHP70=3
MINOR_PHP70=0
PATCHLEVEL_PHP70=18
FULLVERSION_PHP70=$(MAJOR_PHP70).$(MINOR_PHP70).$(PATCHLEVEL_PHP70)
SHORTVERSION_PHP70=$(MAJOR_PHP70).$(MINOR_PHP70)

NAME_PHP71 = typo3gmbh/php71
MAJOR_PHP71=3
MINOR_PHP71=0
PATCHLEVEL_PHP71=17
FULLVERSION_PHP71=$(MAJOR_PHP71).$(MINOR_PHP71).$(PATCHLEVEL_PHP71)
SHORTVERSION_PHP71=$(MAJOR_PHP71).$(MINOR_PHP71)

NAME_PHP72 = typo3gmbh/php72
MAJOR_PHP72=4
MINOR_PHP72=0
PATCHLEVEL_PHP72=2
FULLVERSION_PHP72=$(MAJOR_PHP72).$(MINOR_PHP72).$(PATCHLEVEL_PHP72)
SHORTVERSION_PHP72=$(MAJOR_PHP72).$(MINOR_PHP72)

NAME_PHP73 = typo3gmbh/php73
MAJOR_PHP73=4
MINOR_PHP73=0
PATCHLEVEL_PHP73=3
FULLVERSION_PHP73=$(MAJOR_PHP73).$(MINOR_PHP73).$(PATCHLEVEL_PHP73)
SHORTVERSION_PHP73=$(MAJOR_PHP73).$(MINOR_PHP73)

NAME_PHP74 = typo3gmbh/php74
MAJOR_PHP74=4
MINOR_PHP74=0
PATCHLEVEL_PHP74=2
FULLVERSION_PHP74=$(MAJOR_PHP74).$(MINOR_PHP74).$(PATCHLEVEL_PHP74)
SHORTVERSION_PHP74=$(MAJOR_PHP74).$(MINOR_PHP74)

NAME_PHP80 = typo3gmbh/php80
MAJOR_PHP80=1
MINOR_PHP80=0
PATCHLEVEL_PHP80=3
FULLVERSION_PHP80=$(MAJOR_PHP80).$(MINOR_PHP80).$(PATCHLEVEL_PHP80)
SHORTVERSION_PHP80=$(MAJOR_PHP80).$(MINOR_PHP80)

NAME_JS = typo3gmbh/js
MAJOR_JS=3
MINOR_JS=1
PATCHLEVEL_JS=0
FULLVERSION_JS=$(MAJOR_JS).$(MINOR_JS).$(PATCHLEVEL_JS)
SHORTVERSION_JS=$(MAJOR_JS).$(MINOR_JS)

NAME_BAMBOO = typo3gmbh/bamboo-remote-agent
MAJOR_BAMBOO=1
MINOR_BAMBOO=0
PATCHLEVEL_BAMBOO=14
FULLVERSION_BAMBOO=$(MAJOR_BAMBOO).$(MINOR_BAMBOO).$(PATCHLEVEL_BAMBOO)
SHORTVERSION_BAMBOO=$(MAJOR_BAMBOO).$(MINOR_BAMBOO)



.PHONY: \
	all \
	build \
	build_baseimage \
	build_php53 \
	build_php54 \
	build_php55 \
	build_php56 \
	build_php70 \
	build_php71 \
	build_php72 \
	build_php73 \
	build_php74 \
	build_php80 \
	build_js \
	build_bamboo \
	release \
	release_baseimage \
	release_php53 \
	release_php54 \
	release_php55 \
	release_php56 \
	release_php70 \
	release_php71 \
	release_php72 \
	release_php73 \
	release_php74 \
	release_php80 \
	release_js \
	release_bamboo \
	clean \
	clean_baseimage \
	clean_php53 \
	clean_php54 \
	clean_php55 \
	clean_php56 \
	clean_php70 \
	clean_php71 \
	clean_php72 \
	clean_php73 \
	clean_php74 \
	clean_php80 \
	clean_js \
	clean_bamboo \
	clean_images \
	clean_images_baseimage \
	clean_images_php53 \
	clean_images_php54 \
	clean_images_php55 \
	clean_images_php56 \
	clean_images_php70 \
	clean_images_php71 \
	clean_images_php72 \
	clean_images_php73 \
	clean_images_php74 \
	clean_images_php80 \
	clean_images_js \
	clean_images_bamboo



all: \
	build

build: \
	build_baseimage \
	build_php \
	build_bamboo \
	build_js

build_php: \
	build_php53 \
	build_php54 \
	build_php55 \
	build_php56 \
	build_php70 \
	build_php71 \
	build_php72 \
	build_php73 \
	build_php74 \
	build_php80

release: \
	release_baseimage \
	release_php \
	release_bamboo \
	release_js

release_php: \
	release_php53 \
	release_php54 \
	release_php55 \
	release_php56 \
	release_php70 \
	release_php71 \
	release_php72 \
	release_php73 \
	release_php74 \
	release_php80

clean: \
	clean_baseimage \
	clean_php53 \
	clean_php54 \
	clean_php55 \
	clean_php56 \
	clean_php70 \
	clean_php71 \
	clean_php72 \
	clean_php73 \
	clean_php74 \
	clean_php80 \
	clean_bamboo \
	clean_js


clean_images: \
	clean_images_baseimage \
	clean_images_php53 \
	clean_images_php54 \
	clean_images_php55 \
	clean_images_php56 \
	clean_images_php70 \
	clean_images_php71 \
	clean_images_php72 \
	clean_images_php73 \
	clean_images_php74 \
	clean_images_php80 \
	clean_images_bamboo \
	clean_js


build_baseimage:
	rm -rf build_baseimage
	cp -pR baseimage build_baseimage
	docker build --pull -t $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) build_baseimage
	docker tag $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) $(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE)
	docker tag $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) $(REGISTRY)$(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE)
	docker tag $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) $(REGISTRY)$(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE)

release_baseimage:
	@if ! docker images $(NAME_BASEIMAGE) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_BASEIMAGE); then \
		echo "$(NAME_BASEIMAGE) version $(FULLVERSION_BASEIMAGE) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) $(NAME_BASEIMAGE):latest
	docker tag $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) $(REGISTRY)$(NAME_BASEIMAGE):latest
	docker push $(NAME_BASEIMAGE):latest
	docker push $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE)
	docker push $(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE)
	docker push $(REGISTRY)$(NAME_BASEIMAGE):latest
	docker push $(REGISTRY)$(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE)
	docker push $(REGISTRY)$(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE)

clean_baseimage:
	rm -rf build_baseimage

clean_images_baseimage:
	docker rmi $(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) || true
	docker rmi $(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE) || true
	docker rmi $(NAME_BASEIMAGE):latest || true
	docker rmi $(REGISTRY)$(NAME_BASEIMAGE):$(FULLVERSION_BASEIMAGE) || true
	docker rmi $(REGISTRY)$(NAME_BASEIMAGE):$(SHORTVERSION_BASEIMAGE) || true
	docker rmi $(REGISTRY)$(NAME_BASEIMAGE):latest || true



build_php53:
	rm -rf build_php53
	cp -pR php53 build_php53
	docker build -t $(NAME_PHP53):$(FULLVERSION_PHP53) build_php53
	docker tag $(NAME_PHP53):$(FULLVERSION_PHP53) $(NAME_PHP53):$(SHORTVERSION_PHP53)
	docker tag $(NAME_PHP53):$(FULLVERSION_PHP53) $(REGISTRY)$(NAME_PHP53):$(SHORTVERSION_PHP53)
	docker tag $(NAME_PHP53):$(FULLVERSION_PHP53) $(REGISTRY)$(NAME_PHP53):$(FULLVERSION_PHP53)

release_php53:
	@if ! docker images $(NAME_PHP53) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP53); then \
		echo "$(NAME_PHP53) version $(FULLVERSION_PHP53) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP53):$(FULLVERSION_PHP53) $(NAME_PHP53):latest
	docker tag $(NAME_PHP53):$(FULLVERSION_PHP53) $(REGISTRY)$(NAME_PHP53):latest
	docker push $(NAME_PHP53):latest
	docker push $(NAME_PHP53):$(FULLVERSION_PHP53)
	docker push $(NAME_PHP53):$(SHORTVERSION_PHP53)
	docker push $(REGISTRY)$(NAME_PHP53):latest
	docker push $(REGISTRY)$(NAME_PHP53):$(FULLVERSION_PHP53)
	docker push $(REGISTRY)$(NAME_PHP53):$(SHORTVERSION_PHP53)

clean_php53:
	rm -rf build_php53

clean_images_php53:
	docker rmi $(NAME_PHP53):latest || true
	docker rmi $(NAME_PHP53):$(SHORTVERSION_PHP53) || true
	docker rmi $(NAME_PHP53):$(FULLVERSION_PHP53) || true
	docker rmi $(REGISTRY)$(NAME_PHP53):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP53):$(SHORTVERSION_PHP53) || true
	docker rmi $(REGISTRY)$(NAME_PHP53):$(FULLVERSION_PHP53) || true


build_php54:
	rm -rf build_php54
	cp -pR php54 build_php54
	docker build -t $(NAME_PHP54):$(FULLVERSION_PHP54) build_php54
	docker tag $(NAME_PHP54):$(FULLVERSION_PHP54) $(NAME_PHP54):$(SHORTVERSION_PHP54)
	docker tag $(NAME_PHP54):$(FULLVERSION_PHP54) $(REGISTRY)$(NAME_PHP54):$(SHORTVERSION_PHP54)
	docker tag $(NAME_PHP54):$(FULLVERSION_PHP54) $(REGISTRY)$(NAME_PHP54):$(FULLVERSION_PHP54)

release_php54:
	@if ! docker images $(NAME_PHP54) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP54); then \
		echo "$(NAME_PHP54) version $(FULLVERSION_PHP54) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP54):$(FULLVERSION_PHP54) $(NAME_PHP54):latest
	docker tag $(NAME_PHP54):$(FULLVERSION_PHP54) $(REGISTRY)$(NAME_PHP54):latest
	docker push $(NAME_PHP54):latest
	docker push $(NAME_PHP54):$(FULLVERSION_PHP54)
	docker push $(NAME_PHP54):$(SHORTVERSION_PHP54)
	docker push $(REGISTRY)$(NAME_PHP54):latest
	docker push $(REGISTRY)$(NAME_PHP54):$(FULLVERSION_PHP54)
	docker push $(REGISTRY)$(NAME_PHP54):$(SHORTVERSION_PHP54)

clean_php54:
	rm -rf build_php54

clean_images_php54:
	docker rmi $(NAME_PHP54):latest || true
	docker rmi $(NAME_PHP54):$(SHORTVERSION_PHP54) || true
	docker rmi $(NAME_PHP54):$(FULLVERSION_PHP54) || true
	docker rmi $(REGISTRY)$(NAME_PHP54):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP54):$(SHORTVERSION_PHP54) || true
	docker rmi $(REGISTRY)$(NAME_PHP54):$(FULLVERSION_PHP54) || true


build_php55:
	rm -rf build_php55
	cp -pR php55 build_php55
	docker build -t $(NAME_PHP55):$(FULLVERSION_PHP55) build_php55
	docker tag $(NAME_PHP55):$(FULLVERSION_PHP55) $(NAME_PHP55):$(SHORTVERSION_PHP55)
	docker tag $(NAME_PHP55):$(FULLVERSION_PHP55) $(REGISTRY)$(NAME_PHP55):$(SHORTVERSION_PHP55)
	docker tag $(NAME_PHP55):$(FULLVERSION_PHP55) $(REGISTRY)$(NAME_PHP55):$(FULLVERSION_PHP55)

release_php55:
	@if ! docker images $(NAME_PHP55) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP55); then \
		echo "$(NAME_PHP55) version $(FULLVERSION_PHP55) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP55):$(FULLVERSION_PHP55) $(NAME_PHP55):latest
	docker tag $(NAME_PHP55):$(FULLVERSION_PHP55) $(REGISTRY)$(NAME_PHP55):latest
	docker push $(NAME_PHP55):latest
	docker push $(NAME_PHP55):$(FULLVERSION_PHP55)
	docker push $(NAME_PHP55):$(SHORTVERSION_PHP55)
	docker push $(REGISTRY)$(NAME_PHP55):latest
	docker push $(REGISTRY)$(NAME_PHP55):$(FULLVERSION_PHP55)
	docker push $(REGISTRY)$(NAME_PHP55):$(SHORTVERSION_PHP55)

clean_php55:
	rm -rf build_php55

clean_images_php55:
	docker rmi $(NAME_PHP55):latest || true
	docker rmi $(NAME_PHP55):$(SHORTVERSION_PHP55) || true
	docker rmi $(NAME_PHP55):$(FULLVERSION_PHP55) || true
	docker rmi $(REGISTRY)$(NAME_PHP55):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP55):$(SHORTVERSION_PHP55) || true
	docker rmi $(REGISTRY)$(NAME_PHP55):$(FULLVERSION_PHP55) || true


build_php56:
	rm -rf build_php56
	cp -pR php56 build_php56
	docker build -t $(NAME_PHP56):$(FULLVERSION_PHP56) build_php56
	docker tag $(NAME_PHP56):$(FULLVERSION_PHP56) $(NAME_PHP56):$(SHORTVERSION_PHP56)
	docker tag $(NAME_PHP56):$(FULLVERSION_PHP56) $(REGISTRY)$(NAME_PHP56):$(SHORTVERSION_PHP56)
	docker tag $(NAME_PHP56):$(FULLVERSION_PHP56) $(REGISTRY)$(NAME_PHP56):$(FULLVERSION_PHP56)

release_php56:
	@if ! docker images $(NAME_PHP56) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP56); then \
		echo "$(NAME_PHP56) version $(FULLVERSION_PHP56) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP56):$(FULLVERSION_PHP56) $(NAME_PHP56):latest
	docker tag $(NAME_PHP56):$(FULLVERSION_PHP56) $(REGISTRY)$(NAME_PHP56):latest
	docker push $(NAME_PHP56):latest
	docker push $(NAME_PHP56):$(FULLVERSION_PHP56)
	docker push $(NAME_PHP56):$(SHORTVERSION_PHP56)
	docker push $(REGISTRY)$(NAME_PHP56):latest
	docker push $(REGISTRY)$(NAME_PHP56):$(FULLVERSION_PHP56)
	docker push $(REGISTRY)$(NAME_PHP56):$(SHORTVERSION_PHP56)

clean_php56:
	rm -rf build_php56

clean_images_php56:
	docker rmi $(NAME_PHP56):latest || true
	docker rmi $(NAME_PHP56):$(SHORTVERSION_PHP56) || true
	docker rmi $(NAME_PHP56):$(FULLVERSION_PHP56) || true
	docker rmi $(REGISTRY)$(NAME_PHP56):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP56):$(SHORTVERSION_PHP56) || true
	docker rmi $(REGISTRY)$(NAME_PHP56):$(FULLVERSION_PHP56) || true


build_php70:
	rm -rf build_php70
	cp -pR php70 build_php70
	docker build -t $(NAME_PHP70):$(FULLVERSION_PHP70) build_php70
	docker tag $(NAME_PHP70):$(FULLVERSION_PHP70) $(NAME_PHP70):$(SHORTVERSION_PHP70)
	docker tag $(NAME_PHP70):$(FULLVERSION_PHP70) $(REGISTRY)$(NAME_PHP70):$(SHORTVERSION_PHP70)
	docker tag $(NAME_PHP70):$(FULLVERSION_PHP70) $(REGISTRY)$(NAME_PHP70):$(FULLVERSION_PHP70)

release_php70:
	@if ! docker images $(NAME_PHP70) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP70); then \
		echo "$(NAME_PHP70) version $(FULLVERSION_PHP70) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP70):$(FULLVERSION_PHP70) $(NAME_PHP70):latest
	docker tag $(NAME_PHP70):$(FULLVERSION_PHP70) $(REGISTRY)$(NAME_PHP70):latest
	docker push $(NAME_PHP70):latest
	docker push $(NAME_PHP70):$(FULLVERSION_PHP70)
	docker push $(NAME_PHP70):$(SHORTVERSION_PHP70)
	docker push $(REGISTRY)$(NAME_PHP70):latest
	docker push $(REGISTRY)$(NAME_PHP70):$(FULLVERSION_PHP70)
	docker push $(REGISTRY)$(NAME_PHP70):$(SHORTVERSION_PHP70)

clean_php70:
	rm -rf build_php70

clean_images_php70:
	docker rmi $(NAME_PHP70):latest || true
	docker rmi $(NAME_PHP70):$(SHORTVERSION_PHP70) || true
	docker rmi $(NAME_PHP70):$(FULLVERSION_PHP70) || true
	docker rmi $(REGISTRY)$(NAME_PHP70):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP70):$(SHORTVERSION_PHP70) || true
	docker rmi $(REGISTRY)$(NAME_PHP70):$(FULLVERSION_PHP70) || true


build_php71:
	rm -rf build_php71
	cp -pR php71 build_php71
	docker build -t $(NAME_PHP71):$(FULLVERSION_PHP71) build_php71
	docker tag $(NAME_PHP71):$(FULLVERSION_PHP71) $(NAME_PHP71):$(SHORTVERSION_PHP71)
	docker tag $(NAME_PHP71):$(FULLVERSION_PHP71) $(REGISTRY)$(NAME_PHP71):$(SHORTVERSION_PHP71)
	docker tag $(NAME_PHP71):$(FULLVERSION_PHP71) $(REGISTRY)$(NAME_PHP71):$(FULLVERSION_PHP71)

release_php71:
	@if ! docker images $(NAME_PHP71) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP71); then \
		echo "$(NAME_PHP71) version $(FULLVERSION_PHP71) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP71):$(FULLVERSION_PHP71) $(NAME_PHP71):latest
	docker tag $(NAME_PHP71):$(FULLVERSION_PHP71) $(REGISTRY)$(NAME_PHP71):latest
	docker push $(NAME_PHP71):latest
	docker push $(NAME_PHP71):$(FULLVERSION_PHP71)
	docker push $(NAME_PHP71):$(SHORTVERSION_PHP71)
	docker push $(REGISTRY)$(NAME_PHP71):latest
	docker push $(REGISTRY)$(NAME_PHP71):$(FULLVERSION_PHP71)
	docker push $(REGISTRY)$(NAME_PHP71):$(SHORTVERSION_PHP71)

clean_php71:
	rm -rf build_php71

clean_images_php71:
	docker rmi $(NAME_PHP71):latest || true
	docker rmi $(NAME_PHP71):$(SHORTVERSION_PHP71) || true
	docker rmi $(NAME_PHP71):$(FULLVERSION_PHP71) || true
	docker rmi $(REGISTRY)$(NAME_PHP71):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP71):$(SHORTVERSION_PHP71) || true
	docker rmi $(REGISTRY)$(NAME_PHP71):$(FULLVERSION_PHP71) || true


build_php72:
	rm -rf build_php72
	cp -pR php72 build_php72
	docker build -t $(NAME_PHP72):$(FULLVERSION_PHP72) build_php72
	docker tag $(NAME_PHP72):$(FULLVERSION_PHP72) $(NAME_PHP72):$(SHORTVERSION_PHP72)
	docker tag $(NAME_PHP72):$(FULLVERSION_PHP72) $(REGISTRY)$(NAME_PHP72):$(SHORTVERSION_PHP72)
	docker tag $(NAME_PHP72):$(FULLVERSION_PHP72) $(REGISTRY)$(NAME_PHP72):$(FULLVERSION_PHP72)

release_php72:
	@if ! docker images $(NAME_PHP72) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP72); then \
		echo "$(NAME_PHP72) version $(FULLVERSION_PHP72) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP72):$(FULLVERSION_PHP72) $(NAME_PHP72):latest
	docker tag $(NAME_PHP72):$(FULLVERSION_PHP72) $(REGISTRY)$(NAME_PHP72):latest
	docker push $(NAME_PHP72):latest
	docker push $(NAME_PHP72):$(FULLVERSION_PHP72)
	docker push $(NAME_PHP72):$(SHORTVERSION_PHP72)
	docker push $(REGISTRY)$(NAME_PHP72):latest
	docker push $(REGISTRY)$(NAME_PHP72):$(FULLVERSION_PHP72)
	docker push $(REGISTRY)$(NAME_PHP72):$(SHORTVERSION_PHP72)

clean_php72:
	rm -rf build_php72

clean_images_php72:
	docker rmi $(NAME_PHP72):latest || true
	docker rmi $(NAME_PHP72):$(SHORTVERSION_PHP72) || true
	docker rmi $(NAME_PHP72):$(FULLVERSION_PHP72) || true
	docker rmi $(REGISTRY)$(NAME_PHP72):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP72):$(SHORTVERSION_PHP72) || true
	docker rmi $(REGISTRY)$(NAME_PHP72):$(FULLVERSION_PHP72) || true


build_php73:
	rm -rf build_php73
	cp -pR php73 build_php73
	docker build -t $(NAME_PHP73):$(FULLVERSION_PHP73) build_php73
	docker tag $(NAME_PHP73):$(FULLVERSION_PHP73) $(NAME_PHP73):$(SHORTVERSION_PHP73)
	docker tag $(NAME_PHP73):$(FULLVERSION_PHP73) $(REGISTRY)$(NAME_PHP73):$(SHORTVERSION_PHP73)
	docker tag $(NAME_PHP73):$(FULLVERSION_PHP73) $(REGISTRY)$(NAME_PHP73):$(FULLVERSION_PHP73)

release_php73:
	@if ! docker images $(NAME_PHP73) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP73); then \
		echo "$(NAME_PHP73) version $(FULLVERSION_PHP73) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP73):$(FULLVERSION_PHP73) $(NAME_PHP73):latest
	docker tag $(NAME_PHP73):$(FULLVERSION_PHP73) $(REGISTRY)$(NAME_PHP73):latest
	docker push $(NAME_PHP73):latest
	docker push $(NAME_PHP73):$(FULLVERSION_PHP73)
	docker push $(NAME_PHP73):$(SHORTVERSION_PHP73)
	docker push $(REGISTRY)$(NAME_PHP73):latest
	docker push $(REGISTRY)$(NAME_PHP73):$(FULLVERSION_PHP73)
	docker push $(REGISTRY)$(NAME_PHP73):$(SHORTVERSION_PHP73)

clean_php73:
	rm -rf build_php73

clean_images_php73:
	docker rmi $(NAME_PHP73):latest || true
	docker rmi $(NAME_PHP73):$(SHORTVERSION_PHP73) || true
	docker rmi $(NAME_PHP73):$(FULLVERSION_PHP73) || true
	docker rmi $(REGISTRY)$(NAME_PHP73):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP73):$(SHORTVERSION_PHP73) || true
	docker rmi $(REGISTRY)$(NAME_PHP73):$(FULLVERSION_PHP73) || true


build_php74:
	rm -rf build_php74
	cp -pR php74 build_php74
	docker build -t $(NAME_PHP74):$(FULLVERSION_PHP74) build_php74
	docker tag $(NAME_PHP74):$(FULLVERSION_PHP74) $(NAME_PHP74):$(SHORTVERSION_PHP74)
	docker tag $(NAME_PHP74):$(FULLVERSION_PHP74) $(REGISTRY)$(NAME_PHP74):$(SHORTVERSION_PHP74)
	docker tag $(NAME_PHP74):$(FULLVERSION_PHP74) $(REGISTRY)$(NAME_PHP74):$(FULLVERSION_PHP74)

release_php74:
	@if ! docker images $(NAME_PHP74) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP74); then \
		echo "$(NAME_PHP74) version $(FULLVERSION_PHP74) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP74):$(FULLVERSION_PHP74) $(NAME_PHP74):latest
	docker tag $(NAME_PHP74):$(FULLVERSION_PHP74) $(REGISTRY)$(NAME_PHP74):latest
	docker push $(NAME_PHP74):latest
	docker push $(NAME_PHP74):$(FULLVERSION_PHP74)
	docker push $(NAME_PHP74):$(SHORTVERSION_PHP74)
	docker push $(REGISTRY)$(NAME_PHP74):latest
	docker push $(REGISTRY)$(NAME_PHP74):$(FULLVERSION_PHP74)
	docker push $(REGISTRY)$(NAME_PHP74):$(SHORTVERSION_PHP74)

clean_php74:
	rm -rf build_php74

clean_images_php74:
	docker rmi $(NAME_PHP74):latest || true
	docker rmi $(NAME_PHP74):$(SHORTVERSION_PHP74) || true
	docker rmi $(NAME_PHP74):$(FULLVERSION_PHP74) || true
	docker rmi $(REGISTRY)$(NAME_PHP74):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP74):$(SHORTVERSION_PHP74) || true
	docker rmi $(REGISTRY)$(NAME_PHP74):$(FULLVERSION_PHP74) || true

build_php80:
	rm -rf build_php80
	cp -pR php80 build_php80
	docker build -t $(NAME_PHP80):$(FULLVERSION_PHP80) build_php80
	docker tag $(NAME_PHP80):$(FULLVERSION_PHP80) $(NAME_PHP80):$(SHORTVERSION_PHP80)
	docker tag $(NAME_PHP80):$(FULLVERSION_PHP80) $(REGISTRY)$(NAME_PHP80):$(SHORTVERSION_PHP80)
	docker tag $(NAME_PHP80):$(FULLVERSION_PHP80) $(REGISTRY)$(NAME_PHP80):$(FULLVERSION_PHP80)

release_php80:
	@if ! docker images $(NAME_PHP80) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_PHP80); then \
		echo "$(NAME_PHP80) version $(FULLVERSION_PHP80) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_PHP80):$(FULLVERSION_PHP80) $(NAME_PHP80):latest
	docker tag $(NAME_PHP80):$(FULLVERSION_PHP80) $(REGISTRY)$(NAME_PHP80):latest
	docker push $(NAME_PHP80):latest
	docker push $(NAME_PHP80):$(FULLVERSION_PHP80)
	docker push $(NAME_PHP80):$(SHORTVERSION_PHP80)
	docker push $(REGISTRY)$(NAME_PHP80):latest
	docker push $(REGISTRY)$(NAME_PHP80):$(FULLVERSION_PHP80)
	docker push $(REGISTRY)$(NAME_PHP80):$(SHORTVERSION_PHP80)

clean_php80:
	rm -rf build_php80

clean_images_php80:
	docker rmi $(NAME_PHP80):latest || true
	docker rmi $(NAME_PHP80):$(SHORTVERSION_PHP80) || true
	docker rmi $(NAME_PHP80):$(FULLVERSION_PHP80) || true
	docker rmi $(REGISTRY)$(NAME_PHP80):latest || true
	docker rmi $(REGISTRY)$(NAME_PHP80):$(SHORTVERSION_PHP80) || true
	docker rmi $(REGISTRY)$(NAME_PHP80):$(FULLVERSION_PHP80) || true


build_bamboo:
	rm -rf build_bamboo
	cp -pR bamboo-remote-agent build_bamboo
	docker build -t $(NAME_BAMBOO):$(FULLVERSION_BAMBOO) build_bamboo

release_bamboo:
	@if ! docker images $(NAME_BAMBOO) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_BAMBOO); then \
		echo "$(NAME_BAMBOO) version $(FULLVERSION_BAMBOO) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_BAMBOO):$(FULLVERSION_BAMBOO) $(NAME_BAMBOO):$(SHORTVERSION_BAMBOO)
	docker tag $(NAME_BAMBOO):$(FULLVERSION_BAMBOO) $(NAME_BAMBOO):latest
	docker tag $(NAME_BAMBOO):$(FULLVERSION_BAMBOO) $(REGISTRY)$(NAME_BAMBOO):$(SHORTVERSION_BAMBOO)
	docker tag $(NAME_BAMBOO):$(FULLVERSION_BAMBOO) $(REGISTRY)$(NAME_BAMBOO):$(FULLVERSION_BAMBOO)
	docker tag $(NAME_BAMBOO):$(FULLVERSION_BAMBOO) $(REGISTRY)$(NAME_BAMBOO):latest
	docker push $(NAME_BAMBOO):latest
	docker push $(NAME_BAMBOO):$(FULLVERSION_BAMBOO)
	docker push $(NAME_BAMBOO):$(SHORTVERSION_BAMBOO)
	docker push $(REGISTRY)$(NAME_BAMBOO):latest
	docker push $(REGISTRY)$(NAME_BAMBOO):$(FULLVERSION_BAMBOO)
	docker push $(REGISTRY)$(NAME_BAMBOO):$(SHORTVERSION_BAMBOO)

clean_bamboo:
	rm -rf build_bamboo

clean_images_bamboo:
	docker rmi $(NAME_BAMBOO):latest || true
	docker rmi $(NAME_BAMBOO):$(SHORTVERSION_BAMBOO) || true
	docker rmi $(NAME_BAMBOO):$(FULLVERSION_BAMBOO) || true
	docker rmi $(REGISTRY)$(NAME_BAMBOO):latest || true
	docker rmi $(REGISTRY)$(NAME_BAMBOO):$(SHORTVERSION_BAMBOO) || true
	docker rmi $(REGISTRY)$(NAME_BAMBOO):$(FULLVERSION_BAMBOO) || true



build_js:
	rm -rf build_js
	cp -pR js build_js
	docker build -t $(NAME_JS):$(FULLVERSION_JS) build_js

release_js:
	@if ! docker images $(NAME_JS) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION_JS); then \
		echo "$(NAME_JS) version $(FULLVERSION_JS) is not yet built. Please run 'make build'"; false; \
	fi
	docker tag $(NAME_JS):$(FULLVERSION_JS) $(NAME_JS):$(SHORTVERSION_JS)
	docker tag $(NAME_JS):$(FULLVERSION_JS) $(NAME_JS):latest
	docker tag $(NAME_JS):$(FULLVERSION_JS) $(REGISTRY)$(NAME_JS):$(SHORTVERSION_JS)
	docker tag $(NAME_JS):$(FULLVERSION_JS) $(REGISTRY)$(NAME_JS):$(FULLVERSION_JS)
	docker tag $(NAME_JS):$(FULLVERSION_JS) $(REGISTRY)$(NAME_JS):latest
	docker push $(NAME_JS):latest
	docker push $(NAME_JS):$(FULLVERSION_JS)
	docker push $(NAME_JS):$(SHORTVERSION_JS)
	docker push $(REGISTRY)$(NAME_JS):latest
	docker push $(REGISTRY)$(NAME_JS):$(FULLVERSION_JS)
	docker push $(REGISTRY)$(NAME_JS):$(SHORTVERSION_JS)

clean_js:
	rm -rf build_js

clean_images_js:
	docker rmi $(NAME_JS):latest || true
	docker rmi $(NAME_JS):$(SHORTVERSION_JS) || true
	docker rmi $(NAME_JS):$(FULLVERSION_JS) || true
	docker rmi $(REGISTRY)$(NAME_JS):latest || true
	docker rmi $(REGISTRY)$(NAME_JS):$(SHORTVERSION_JS) || true
	docker rmi $(REGISTRY)$(NAME_JS):$(FULLVERSION_JS) || true
