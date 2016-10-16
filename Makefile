NAME = typo3gmbh/bamboo-remote-agent
MAJOR=1
MINOR=0
PATCHLEVEL=13
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
	rm -rf php70_image
	cp -pR image php70_image
	echo system.imageVersion=$(FULLVERSION) >> php70_image/config/bamboo/bamboo-capabilities.properties
	docker build -t $(NAME)-php70:$(FULLVERSION) --rm php70_image

release:
	@if ! docker images $(NAME)-php70 | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME)-php70 version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker tag $(NAME)-php70:$(FULLVERSION) $(NAME)-php70:$(SHORTVERSION)
	docker tag $(NAME)-php70:$(FULLVERSION) $(NAME)-php70:latest
	docker push $(NAME)-php70:latest
	docker push $(NAME)-php70:$(FULLVERSION)
	docker push $(NAME)-php70:$(SHORTVERSION)

clean:
	rm -rf php70_image

clean_images:
	docker rmi $(NAME)-php70:latest $(NAME)-php70:$(SHORTVERSION) $(NAME)-php70:$(FULLVERSION) || true