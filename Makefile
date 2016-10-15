NAME = typo3gmbh/baseimage
MAJOR=1
MINOR=0
PATCHLEVEL=1
FULLVERSION=$(MAJOR).$(MINOR).$(PATCHLEVEL)
SHORTVERSION=$(MAJOR).$(MINOR)

all: build

build:
	docker build -t $(NAME):$(FULLVERSION) --rm image

release:
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(FULLVERSION); then echo "$(NAME) version $(FULLVERSION) is not yet built. Please run 'make build'"; false; fi
	docker tag $(NAME):$(FULLVERSION) $(NAME):$(SHORTVERSION)
	docker tag $(NAME):$(FULLVERSION) $(NAME):latest
	docker push $(NAME):latest
	docker push $(NAME):$(FULLVERSION)
	docker push $(NAME):$(SHORTVERSION)

clean_images:
	docker rmi $(NAME):$(FULLVERSION) $(NAME):$(SHORTVERSION) $(NAME):latest || true
