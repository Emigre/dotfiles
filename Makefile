.DEFAULT_GOAL := help

# ===

.PHONY: start
start: ## configures the system
	@ansible-playbook main.yml

.PHONY: vim
vim: ## configures vim only
	@ansible-playbook vim.yml

.PHONY: update
update: ## pulls the repos
	@echo '- Update the dotfiles repo'
	@git pull
	@echo '- Update the vim repo'
	@cd ~/vim && git pull
	@echo '- Update the scripts repo'
	@cd ~/scripts && git pull

# ==

.PHONY: help
help: ## parse jobs and descriptions from this Makefile
	@grep -E '^[ a-zA-Z0-9_-]+:([^=]|$$)' $(MAKEFILE_LIST) \
		| grep -Ev '^help\b[[:space:]]*:' \
		| awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
