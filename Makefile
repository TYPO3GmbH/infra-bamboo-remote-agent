NAME = typo3gmbh/bamboo-remote-agent
MAJOR=1
MINOR=0
PATCHLEVEL=4
FULLVERSION=$(MAJOR).$(MINOR).$(PATCHLEVEL)
SHORTVERSION=$(MAJOR).$(MINOR)

.PHONY: all build_all \
	build_php70 \
	tag_latest release clean clean_images

all: build_all

build_all: \
	build_php70

# Docker doesn't support sharing files between different Dockerfiles. -_-
# So we copy things around.
build_php70:
	rm -rf php70_image
	cp -pR image php70_image
	echo system.imageVersion=$(FULLVERSION) >> php70_image/config/bamboo/bamboo-capabilities.properties
	echo php70=1 >> php70_image/buildconfig
	echo final=1 >> php70_image/buildconfig
	docker build -t $(NAME)-php70:$(FULLVERSION) --rm php70_image
	docker tag $(NAME)-php70:$(FULLVERSION) $(NAME)-php70:$(SHORTVERSION)

tag_latest:
	docker tag $(NAME)-php70:$(FULLVERSION) $(NAME)-php70:latest

release: tag_latest
	@if ! docker images $(NAME)-php70 | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME)-php70 version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)-php70:latest
	docker push $(NAME)-php70:$(FULLVERSION)
	docker push $(NAME)-php70:$(SHORTVERSION)
	# @echo "*** Don't forget to create a tag. git tag rel-$(FULLVERSION) && git push origin rel-$(FULLVERSION)"

clean:
	rm -rf php70_image

clean_images:
	docker rmi $(NAME)-php70:latest $(NAME)-php70:$(FULLVERSION) || true
