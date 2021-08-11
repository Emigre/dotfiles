.DEFAULT_GOAL := dotfiles

.PHONY: dotfiles
dotfiles:
	@ln -s `pwd`/gitconfig $$HOME/.gitconfig
	@ln -s `pwd`/gitignore_global $$HOME/.gitignore_global
	@ln -s `pwd`/tmux.conf $$HOME/.tmux.conf
	@ln -s `pwd`/zshenv $$HOME/.zshenv
	@ln -s `pwd`/zshrc $$HOME/.zshrc
	@echo 'Done'

.PHONY: clean
clean:
	@if [[ -L "$$HOME/.gitconfig" ]]; then unlink $$HOME/.gitconfig; fi
	@if [[ -L "$$HOME/.gitignore_global" ]]; then unlink $$HOME/.gitignore_global; fi
	@if [[ -L "$$HOME/.tmux.conf" ]]; then unlink $$HOME/.tmux.conf; fi
	@if [[ -L "$$HOME/.zshenv" ]]; then unlink $$HOME/.zshenv; fi
	@if [[ -L "$$HOME/.zshrc" ]]; then unlink $$HOME/.zshrc; fi
	@echo 'Done'
