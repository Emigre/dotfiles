# Dotfiles

1. Install [homebrew](https://brew.sh/) and then git, Ansible and Firefox with it: `brew cask install git ansible firefox`. In Firefox, install and log in to the LastPass and Raindrop extensions

2. [Configure access to GitHub](docs/GITHUB.md), clone the dotfiles repo `git clone git@github.com:Emigre/dotfiles.git $HOME/dotfiles`

3. In the dotfiles folder and run `make dotfiles` and then `make apps` to install the software

4. Manually set up [the system preferences](docs/OSX.md), [Firefox](docs/FIREFOX.md) and [iTerm](docs/ITERM.md)

5. Run other targets in the dotfiles folder to configure each desired programming languages, and then [configure IDEs, editors and tools](docs/IDES.md)

6. If necessary install other applications that have not had their installation automated, like the Adobe Creative Suite, Steam or Unity
