NAME = typo3gmbh/baseimage
VERSION = 1.0.0

all: build

build: \
	docker build -t $(NAME):$(VERSION) --rm image

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag."

clean_images:
	docker rmi $(NAME):latest $(NAME):$(VERSION) || true
