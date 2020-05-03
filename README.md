# Dotfiles

1. Install [homebrew](https://brew.sh/) and then git, Ansible, Firefox and Caffeine with it: `brew cask install git ansible firefox caffeine`. In Firefox, install and log in to the LastPass and Raindrop extensions

2. [Configure access to GitHub](docs/GITHUB.md), clone the dotfiles repo `git clone git@github.com:Emigre/dotfiles.git $HOME/dotfiles` 

3. Run `make dotfiles` in the dotfiles folder, then run `make apps` to install the software. Run other targets in the dotfiles folder to configure programming languages as needed, install IDEs if necessary: `brew cask install clion`, `brew cask install intellij-idea`, `brew cask install appcode`

4. Manually set up: [OSX system preferences](docs/OSX.md) / [Firefox](docs/FIREFOX.md) / [iTerm](docs/ITERM.md) / [IDEs and editors](docs/IDES.md)