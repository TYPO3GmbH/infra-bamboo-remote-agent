NAME = typo3gmbh/bamboo-remote-agent
MAJOR=1
MINOR=0
PATCHLEVEL=5
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
	rm -rf php71_image
	cp -pR image php71_image
	echo system.imageVersion=$(FULLVERSION) >> php71_image/config/bamboo/bamboo-capabilities.properties
	docker build -t $(NAME)-php71:$(FULLVERSION) --rm php71_image

release:
	@if ! docker images $(NAME)-php71 | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME)-php71 version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker tag $(NAME)-php71:$(FULLVERSION) $(NAME)-php71:$(SHORTVERSION)
	docker tag $(NAME)-php71:$(FULLVERSION) $(NAME)-php71:latest
	docker push $(NAME)-php71:latest
	docker push $(NAME)-php71:$(FULLVERSION)
	docker push $(NAME)-php71:$(SHORTVERSION)

clean:
	rm -rf php71_image

clean_images:
	docker rmi $(NAME)-php71:latest $(NAME)-php71:$(SHORTVERSION) $(NAME)-php71:$(FULLVERSION) || true
