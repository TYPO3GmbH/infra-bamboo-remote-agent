NAME = typo3/bamboo-agent
VERSION = 1.0.0

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
	echo php70=1 >> php70_image/buildconfig
	echo final=1 >> php70_image/buildconfig
	docker build -t $(NAME)-php70:$(VERSION) --rm php70_image

tag_latest:
	docker tag -f $(NAME)-php70:$(VERSION) $(NAME)-php70:latest

release: tag_latest
	@if ! docker images $(NAME)-php70 | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME)-php70 version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)-php70
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

clean:
	rm -rf php70_image

clean_images:
	docker rmi typo3/bamboo-agent-php70:latest typo3/bamboo-agent-php70:$(VERSION) || true
