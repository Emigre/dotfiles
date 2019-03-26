.DEFAULT_GOAL := help

# ===

.PHONY: start
start: ## runs ansible to configure the system
	@ansible-playbook main.yml

.PHONY: vim
vim: ## runs ansible to configure vim only
	@ansible-playbook vim.yml

.PHONY: backup
backup: ## creates a backup of the current state of the vim plugins and coc extensions
	@echo '- Creating a backup  of the current state of the vim plugins and coc extensions'
	$(eval BACKUP_FILE_NAME := "vim-$(shell bash -c "date +\"%Y%m%dT%H%M%S\"").zip")
	@zip -9 -r $$HOME/Dropbox/backups/$(BACKUP_FILE_NAME) \
		$$HOME/vim --exclude=backups --exclude=swaps --exclude=undo --exclude=.netrwhist
	@echo "------------------------------------------------------------------------"
	@echo ""
	@echo "$(BACKUP_FILE_NAME)"
	@du -h $$HOME/Dropbox/backups/$(BACKUP_FILE_NAME) | head -n1 | awk '{print $$1;}'
	@echo ""

.PHONY: clean
clean: ## removes the currently installed vim plugins and coc extensions
	@echo '- This will delete all the files in ~/.vim/plugged/ and ~/.config/coc/extensions/node_modules/'
	@( read -p "- Are you sure that you want to do this? [y/N]: " sure && case "$$sure" in [yY]) true;; *) false;; esac )
	@echo '- Deleting the vim plugins'
	@rm -rf $$HOME/.vim/plugged/*
	@echo '- Deleting the coc extensions'
	@rm -rf $$HOME/.config/coc/extensions/node_modules

.PHONY: pull
pull: ## pulls the changes for the vim, scripts and dotfiles repos
	@echo '- Updating the dotfiles repo'
	@git pull
	@echo '- Updating the vim repo'
	@cd $$HOME/vim && git pull
	@echo '- Updating the ranger repo'
	@cd $$HOME/ranger && git pull
	@echo '- Updating the scripts repo'
	@cd $$HOME/scripts && git pull

# ==

.PHONY: help
help: ## parse jobs and descriptions from this Makefile
	@grep -E '^[ a-zA-Z0-9_-]+:([^=]|$$)' $(MAKEFILE_LIST) \
		| grep -Ev '^help\b[[:space:]]*:' \
		| awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
