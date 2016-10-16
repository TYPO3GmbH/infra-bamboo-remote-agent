NAME = typo3gmbh/bamboo-remote-agent
MAJOR=1
MINOR=0
PATCHLEVEL=1
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
	rm -rf php55_image
	cp -pR image php55_image
	echo system.imageVersion=$(FULLVERSION) >> php55_image/config/bamboo/bamboo-capabilities.properties
	docker build -t $(NAME)-php55:$(FULLVERSION) --rm php55_image

release:
	@if ! docker images $(NAME)-php55 | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME)-php55 version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker tag $(NAME)-php55:$(FULLVERSION) $(NAME)-php55:$(SHORTVERSION)
	docker tag $(NAME)-php55:$(FULLVERSION) $(NAME)-php55:latest
	docker push $(NAME)-php55:latest
	docker push $(NAME)-php55:$(FULLVERSION)
	docker push $(NAME)-php55:$(SHORTVERSION)

clean:
	rm -rf php55_image

clean_images:
	docker rmi $(NAME)-php55:latest $(NAME)-php55:$(SHORTVERSION) $(NAME)-php55:$(FULLVERSION) || true