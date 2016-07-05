NAME = typo3gmbh/bamboo-remote-agent
MAJOR=1
MINOR=0
PATCHLEVEL=1
FULLVERSION=$(MAJOR).$(MINOR).$(PATCHLEVEL)
SHORTVERSION=$(MAJOR).$(MINOR)

.PHONY: all build_all \
	build_php71 \
	tag_latest release clean clean_images

all: build_all

build_all: \
	build_php71

# Docker doesn't support sharing files between different Dockerfiles. -_-
# So we copy things around.
build_php71:
	rm -rf php71_image
	cp -pR image php71_image
	echo system.imageVersion=$(FULLVERSION) >> php71_image/config/bamboo/bamboo-capabilities.properties
	echo final=1 >> php71_image/buildconfig
	docker build -t $(NAME)-php71:$(FULLVERSION) --rm php71_image
	docker tag $(NAME)-php71:$(FULLVERSION) $(NAME)-php71:$(SHORTVERSION)

tag_latest:
	docker tag $(NAME)-php71:$(FULLVERSION) $(NAME)-php71:latest

release: tag_latest
	@if ! docker images $(NAME)-php71 | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME)-php71 version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)-php71:latest
	docker push $(NAME)-php71:$(FULLVERSION)
	docker push $(NAME)-php71:$(SHORTVERSION)
	# @echo "*** Don't forget to create a tag. git tag rel-$(FULLVERSION) && git push origin rel-$(FULLVERSION)"

clean:
	rm -rf php71_image

clean_images:
	docker rmi $(NAME)-php71:latest $(NAME)-php71:$(FULLVERSION) || true
