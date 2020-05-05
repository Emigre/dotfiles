# Dotfiles

1. Install [homebrew](https://brew.sh/) and then git, Ansible, Firefox and Caffeine with it: `brew cask install git ansible firefox caffeine`. In Firefox, install and log in to the LastPass and Raindrop extensions

2. [Configure access to GitHub](docs/GITHUB.md), clone the dotfiles repo `git clone git@github.com:Emigre/dotfiles.git $HOME/dotfiles`

3. In the dotfiles folder and run `make dotfiles` and then `make apps` to install the software

4. Run other targets in the dotfiles folder to configure programming languages as needed, then install the IDEs: `brew cask install clion`, `brew cask install intellij-idea`, `brew cask install appcode`, etc. Check the [code analysis, formatting and linting](docs/CODE.md) table for other requirements for each language

5. Manually set up: [OSX system preferences](docs/OSX.md) / [Firefox](docs/FIREFOX.md) / [iTerm](docs/ITERM.md) / [IDEs and editors](docs/IDES.md)
