.DEFAULT_GOAL := help

# ===

.PHONY: dotfiles
dotfiles: ## configures the dotfiles
	@ansible-playbook main.yml --tags 'dotfiles'

.PHONY: apps
apps: ## installs the applications
	@ansible-playbook main.yml --tags 'apps'

.PHONY: cpp
cpp: ## sets up c++
	@ansible-playbook main.yml --tags 'cpp'

.PHONY: erlang
erlang: ## sets up erlang and elixir
	@ansible-playbook main.yml --tags 'erlang'

.PHONY: java
java: ## sets up java
	@ansible-playbook main.yml --tags 'java'

.PHONY: javascript
javascript: ## sets up javascript
	@ansible-playbook main.yml --tags 'javascript'

.PHONY: python
python: ## sets up python
	@ansible-playbook main.yml --tags 'python'

# ==

.PHONY: help
help: ## parse jobs and descriptions from this Makefile
	@grep -E '^[ a-zA-Z0-9_-]+:([^=]|$$)' $(MAKEFILE_LIST) \
		| grep -Ev '^help\b[[:space:]]*:' \
		| awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
