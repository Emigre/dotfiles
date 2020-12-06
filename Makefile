.DEFAULT_GOAL := help

.PHONY: dotfiles
dotfiles: ## configures the dotfiles
	@ansible-playbook -i localhost, dotfiles.yaml

.PHONY: apps
apps: ## installs the applications
	@ansible-playbook -i localhost, apps.yaml

.PHONY: help
help: ## parse jobs and descriptions from this Makefile
	@grep -E '^[ a-zA-Z0-9_-]+:([^=]|$$)' $(MAKEFILE_LIST) \
		| grep -Ev '^help\b[[:space:]]*:' \
		| awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
