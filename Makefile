.DEFAULT_GOAL := help

# ------------------- Dotfiles -------------------

.PHONY: dotfiles
dotfiles: ## configures the dotfiles
	ln -s `pwd`/_gitconfig $$HOME/.gitconfig
	ln -s `pwd`/_gitignore_global $$HOME/.gitignore_global
	ln -s `pwd`/_tmux.conf $$HOME/.tmux.conf
	ln -s `pwd`/_zshenv $$HOME/.zshenv
	ln -s `pwd`/_zshrc $$HOME/.zshrc

# ------------------- Apps -------------------

.PHONY: apps
apps: ## installs the applications
    
#	brew install ack
#	brew install ag
#	brew install ansible
	brew install arp-scan
#	brew install carthage
#	brew install coreutils
	brew install git
	brew install hexedit
#	brew install ngrep
	brew install htop
#	brew install httperf
#	brew install jq
#	brew install lnav
#	brew install nmap
#	brew install openssl
	brew install postgresql
#	brew install rlwrap
#	brew install tcptrace
	brew install tcptraceroute
	brew install tmux
	brew install tree
	brew install wget
#	brew cask install anaconda
#	brew cask install android-studio
	brew cask install cryptomator
#	brew cask install daisydisk
#	brew cask install discord
	brew cask install dropbox
#	brew cask install evernote
	brew cask install expressvpn
	brew cask install firefox
	brew cask install iterm2
#	brew cask install keybase
#	brew cask install mactex-no-gui
#	brew cask install postman
#	brew cask install sync
#	brew cask install skype
#	brew cask install slack
#	brew cask install the-unarchiver
#	brew cask install vlc
#	brew cask install zoomus
	brew tap homebrew/cask-fonts
	brew install font-meslo-lg-nerd-font

# --------------------------------------------

.PHONY: help
help: ## parse jobs and descriptions from this Makefile
	@grep -E '^[ a-zA-Z0-9_-]+:([^=]|$$)' $(MAKEFILE_LIST) \
		| grep -Ev '^help\b[[:space:]]*:' \
		| awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
