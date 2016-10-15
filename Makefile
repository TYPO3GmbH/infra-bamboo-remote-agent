NAME = typo3gmbh/bamboo-remote-agent
MAJOR=1
MINOR=0
PATCHLEVEL=0
FULLVERSION=$(MAJOR).$(MINOR).$(PATCHLEVEL)
SHORTVERSION=$(MAJOR).$(MINOR)

.PHONY: \
	all \
	build \
	release \
	clean \
	clean_images

all: build

build:
	rm -rf php56_image
	cp -pR image php56_image
	echo system.imageVersion=$(FULLVERSION) >> php56_image/config/bamboo/bamboo-capabilities.properties
	docker build -t $(NAME)-php56:$(FULLVERSION) --rm php56_image

release:
	@if ! docker images $(NAME)-php56 | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME)-php56 version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker tag $(NAME)-php56:$(FULLVERSION) $(NAME)-php56:$(SHORTVERSION)
	docker tag $(NAME)-php56:$(FULLVERSION) $(NAME)-php56:latest
	docker push $(NAME)-php56:latest
	docker push $(NAME)-php56:$(FULLVERSION)
	docker push $(NAME)-php56:$(SHORTVERSION)

clean:
	rm -rf php56_image

clean_images:
	docker rmi $(NAME)-php56:latest $(NAME)-php56:$(SHORTVERSION) $(NAME)-php56:$(FULLVERSION) || true
