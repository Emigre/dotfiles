.DEFAULT_GOAL := dotfiles

config_folders := git kitty tmux

zsh_files := zshenv zshrc

define link_file
	if [[ ! -L "$(2)" ]] && [[ ! -d "$(2)" ]]; then \
		ln -s "$(CURDIR)/$(1)" "$(2)"; \
	else \
		echo "... $(2) already exists"; \
	fi;
endef

define unlink_file
	if [[ -L "$(1)" ]]; then \
		unlink "$(1)"; \
	fi;
endef

dotfiles:
	@$(foreach folder,$(config_folders),$(call link_file,$(folder),$$HOME/.config/$(folder)))
	@$(foreach file,$(zsh_files),$(call link_file,$(file),$$HOME/.$(file)))
	@echo 'Done'

clean:
	@$(foreach folder,$(config_folders),$(call unlink_file,$$HOME/.config/$(folder)))
	@$(foreach file,$(zsh_files),$(call unlink_file,$$HOME/.$(file)))
	@echo 'Done'
