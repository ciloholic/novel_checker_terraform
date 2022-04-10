SHELL := /bin/bash
.DEFAULT_GOAL := init

# ===============================================
# https://gist.github.com/tadashi-aikawa/da73d277a3c1ec6767ed48d1335900f3
# ===============================================
help:    ## help
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9][a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')
# ===============================================

init:    ## terraform init
	@terraform init -upgrade
plan:    ## terraform plan
	@terraform plan
apply:   ## terraform apply
	@terraform apply
destroy: ## terraform destroy
	@terraform destroy
val:     ## terraform validate
	@terraform validate
fmt:     ## terraform fmt
	@terraform fmt -recursive
c:       ## terraform console
	@terraform console
update:  ## tfupdate update
	@docker run -it --rm -v $$(pwd):/tf minamijoyo/tfupdate terraform -r /tf
	@docker run -it --rm -v $$(pwd):/tf minamijoyo/tfupdate provider google -r /tf
