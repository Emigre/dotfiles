.DEFAULT_GOAL := dotfiles

files := $(filter-out Makefile, $(wildcard *))

define link_file
	if [[ ! -f "$$HOME/$(1)" ]]; then \
		ln -s `pwd`/gitconfig $$HOME/$(1) ; \
	else \
		echo "... $(1) already exists in the home folder"; \
	fi;
endef

define unlink_file
	if [[ -L "$$HOME/$(1)" ]]; then \
		unlink $$HOME/$(1); \
	fi;
endef

dotfiles:
	@$(foreach file,$(files),$(call link_file,.$(file)))
	@echo 'Done'

clean:
	@$(foreach file,$(files),$(call unlink_file,.$(file)))
	@echo 'Done'
