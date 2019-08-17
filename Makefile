.DEFAULT_GOAL := help

# ===

.PHONY: start
start: ## runs ansible to configure the system
	@ansible-playbook main.yml

.PHONY: vim
vim: ## runs ansible to configure vim only
	@ansible-playbook vim.yml

.PHONY: pull
pull: ## pulls the changes for the vim, scripts, language servers and dotfiles repos
	@echo '- Updating the dotfiles repo'
	@git pull
	@echo '- Updating the vim repo'
	@cd $$HOME/vim && git pull
	@echo '- Updating the ranger repo'
	@cd $$HOME/ranger && git pull
	@echo '- Updating the scripts repo'
	@cd $$HOME/scripts && git pull
	@echo '- Updating the language servers repo'
	@cd $$HOME/language-servers && git pull

# ==

.PHONY: help
help: ## parse jobs and descriptions from this Makefile
	@grep -E '^[ a-zA-Z0-9_-]+:([^=]|$$)' $(MAKEFILE_LIST) \
		| grep -Ev '^help\b[[:space:]]*:' \
		| awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
