DOCKER_USER ?= andybrucenet
PROJECT_NAME ?= docxtemplater
DOCKER_REPO ?= $(DOCKER_USER)/$(PROJECT_NAME)

.PHONY: all build clean rebuild release test push
all: build

build:
	@docker build --tag=$(DOCKER_REPO):latest .

clean:
	rm -fR ./.localdata

rebuild: clean build

release: build
	@docker build --tag=$(DOCKER_REPO):$(shell cat VERSION) .

test:
	@mkdir -p .localdata
	@docker run --rm -it -v $(PWD):/work $(DOCKER_REPO):latest \
		./assets/tests/test-01-doc-test-01.js \
		./assets/docx/Doc-Test-01.docx \
		./.localdata/Doc-Test-01.docx
	@echo 'Created ./.localdata/Doc-Test-01.docx'

push: release
	@docker push $(DOCKER_REPO):latest
	@docker push $(DOCKER_REPO):$(shell cat VERSION)

