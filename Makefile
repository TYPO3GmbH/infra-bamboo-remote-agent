NAME = typo3gmbh/bamboo-remote-agent
MAJOR=1
MINOR=0
PATCHLEVEL=0
FULLVERSION=$(MAJOR).$(MINOR).$(PATCHLEVEL)
SHORTVERSION=$(MAJOR).$(MINOR)

.PHONY: all build_all \
	build_php56 \
	tag_latest release clean clean_images

all: build_all

build_all: \
	build_php56

# Docker doesn't support sharing files between different Dockerfiles. -_-
# So we copy things around.
build_php56:
	rm -rf php56_image
	cp -pR image php56_image
	echo system.imageVersion=$(FULLVERSION) >> php56_image/config/bamboo/bamboo-capabilities.properties
	echo final=1 >> php56_image/buildconfig
	docker build -t $(NAME)-php56:$(FULLVERSION) --rm php56_image
	docker tag $(NAME)-php56:$(FULLVERSION) $(NAME)-php56:$(SHORTVERSION)

tag_latest:
	docker tag $(NAME)-php56:$(FULLVERSION) $(NAME)-php56:latest

release: tag_latest
	@if ! docker images $(NAME)-php56 | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME)-php56 version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)-php56:latest
	docker push $(NAME)-php56:$(FULLVERSION)
	docker push $(NAME)-php56:$(SHORTVERSION)
	# @echo "*** Don't forget to create a tag. git tag rel-$(FULLVERSION) && git push origin rel-$(FULLVERSION)"

clean:
	rm -rf php56_image

clean_images:
	docker rmi $(NAME)-php56:latest $(NAME)-php56:$(FULLVERSION) || true
