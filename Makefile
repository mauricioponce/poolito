help:
	@echo '--------------------------------------------------------------------------'
	@echo '|                             Poolito help commands                      |'
	@echo '--------------------------------------------------------------------------'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

#-----------------------------------------------
# Variables
#-----------------------------------------------
# These variables exist at deployment/docker/.env file
TAG=latest
STAGE=develop
PREFIX=cd docker/ &&

# API
CONTAINER_POOL_NAME=nice-pool -$(STAGE)-$(TAG)

#-----------------------------------------------
# Phony targets
#-----------------------------------------------
.SILENT :
.PHONY: up stop ps logs clean c relaunch api-post build-images

#-----------------------------------------------
# Containers
#-----------------------------------------------
up: ## Containers up!
	$(PREFIX) docker-compose up -d --remove-orphans

stop: ## Containers down!
	$(PREFIX) docker-compose stop

ps: ## Containers status
	$(PREFIX) docker-compose ps

logs: ## Containers logs
	$(PREFIX) docker-compose logs -f

clean: ## remove containers
	@docker rm $(CONTAINER_API_NAME) $(CONTAINER_NGINX_NAME)

c: ## execute a shell into api container
	@docker exec -ti $(CONTAINER_API_NAME) /bin/bash

relaunch: ## stop, clean, build-image up ps
	$(MAKE) stop clean build-image up ps

#-----------------------------------------------
# Image
#-----------------------------------------------
build-image: ## Build image
	$(PREFIX) docker-compose build
