NAME = typo3gmbh/bamboo-remote-agent
MAJOR=1
MINOR=0
PATCHLEVEL=0
FULLVERSION=$(MAJOR).$(MINOR).$(PATCHLEVEL)
SHORTVERSION=$(MAJOR).$(MINOR)

.PHONY: all build_all \
	build_php55 \
	tag_latest release clean clean_images

all: build_all

build_all: \
	build_php55

# Docker doesn't support sharing files between different Dockerfiles. -_-
# So we copy things around.
build_php55:
	rm -rf php55_image
	cp -pR image php55_image
	echo system.imageVersion=$(FULLVERSION) >> php55_image/config/bamboo/bamboo-capabilities.properties
	echo final=1 >> php55_image/buildconfig
	docker build -t $(NAME)-php55:$(FULLVERSION) --rm php55_image
	docker tag $(NAME)-php55:$(FULLVERSION) $(NAME)-php55:$(SHORTVERSION)

tag_latest:
	docker tag $(NAME)-php55:$(FULLVERSION) $(NAME)-php55:latest

release: tag_latest
	@if ! docker images $(NAME)-php55 | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME)-php55 version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)-php55:latest
	docker push $(NAME)-php55:$(FULLVERSION)
	docker push $(NAME)-php55:$(SHORTVERSION)
	# @echo "*** Don't forget to create a tag. git tag rel-$(FULLVERSION) && git push origin rel-$(FULLVERSION)"

clean:
	rm -rf php55_image

clean_images:
	docker rmi $(NAME)-php55:latest $(NAME)-php55:$(FULLVERSION) || true
