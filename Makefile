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
	@echo 'Perform test 1: docxtemplater CLI...'
	@docker run --rm -it -v $(PWD):/work \
	  $(DOCKER_REPO):latest \
	    ./assets/tests/test-01-doc-test-01.json
	@echo 'Perform test 2: docxtemplater librarry...'
	@docker run --rm -it -v $(PWD):/work --entrypoint node \
	  $(DOCKER_REPO):latest \
	    ./assets/tests/test-01-doc-test-02.js \
	    ./assets/docx/Doc-Test.docx \
	    ./.localdata/Doc-Test-02.docx
	@echo 'Tests ran OK'
	@ls -la ./.localdata/

push: release
	@docker push $(DOCKER_REPO):latest
	@docker push $(DOCKER_REPO):$(shell cat VERSION)

