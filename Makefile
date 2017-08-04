DOCKER_USER ?= andybrucenet
PROJECT_NAME ?= docxtemplater
DOCKER_REPO ?= $(DOCKER_USER)/$(PROJECT_NAME)

.PHONY: all help build release push sameersbn-docker-gitlab
all: build

build:
	@docker build --tag=$(DOCKER_REPO):latest .

release: build
	@docker build --tag=$(DOCKER_REPO):$(shell cat VERSION) .

commit:
	@docker commit $(PROJECT_NAME) $(DOCKER_USER)/test-lamp-server:latest

push: release
	@docker push $(DOCKER_REPO):latest
	@docker push $(DOCKER_REPO):$(shell cat VERSION)

