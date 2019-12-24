# Dotfiles

## Usage

1. Install [homebrew](https://brew.sh/)

2. Install Chrome: `brew cask install google-chrome`

3. Install [LastPass](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd)

4. Log in to LastPass and Chrome, and turn sync on in Chrome

5. Install and activate caffeine: `brew cask install caffeine`

6. Install Ansible and git: `brew install ansible git`

7. [Set up SSH access to GitHub](SSH.md)

8. Edit `~/.gituser` with git user name and email

9. Clone the dotfiles repo `git clone git@github.com:Emigre/dotfiles.git $HOME/dotfiles`

10. Run `make start` in the `dotfiles` folder

* Folders `vim`, `language-servers`, `scripts`, `envs` and `ranger` will be created at `$HOME`

## Vim and Language Server Support

* Run `make` in `$HOME/vim` for instructions on how to install the vim plugins and build coc.nvim

* Run `make` in `$HOME/language-servers` for instructions on how to install and compile the language servers

---

## Other

* [Set up e-mail accounts with Mutt](MUTT.md)

* Start [docker for mac](https://www.docker.com/products/docker-desktop), [dropbox](https://www.dropbox.com/) and the [mail notifr](https://ashchan.com/projects/gmail-notifr)

### System Preferences

- In Keyboard
  - Click on 'Modifier Keys...' and Select '^ Control' for the 'Caps Lock Key'
  - Under Shortcuts uncheck 'Mission Control'
- In Trackpad
  - Enable 'Tap to click'
- In Security & Privacy
  - Consider setting Require password 'immediately' after sleep
- In Dock
  - Select the right dock size and magnification
  - Check 'Minimize windows into application icon'
  - Unselect 'Show recent applications in Dock'
  - Select 'Automatically hide and show the Dock'
  - In 'Minimize windows using:' select 'scale effect'
- In Accessibility
  - In Mouse & Trackpad, under Trackpad Options, check 'Enable dragging' and select 'three finger drag'
  - In Display, enable 'Reduce motion' and disable 'Shake mouse pointer to locate'
- In Mission Control deselect 'Show Desktop' and 'Show Dashboard'
- In Bluetooth select 'Show Bluetooth in menu bar'
- In Sound select 'Show volume in menu bar'
- In Time Machine select 'Show Time Machine in menu bar'

### Finder Preferences

- In General
  - In 'New Finder window show:' select the home folder
  - Enable 'Open folders in tabs instead of new windows'
- In Sidebar select the home folder

### iTerm2

- In Preferences > General
  - Check 'Load preferences from a custom folder or URL' and set it to `~/.iterm2.d/`
  - Check 'Save changes to folder when iTerm2 quits'
  - Check 'Applications in terminal may access clipboard'
- In Preferences > Profiles
  - In the 'Window' menu, select 'Full-Height Left of Screen' in the 'Style' selector
  - In the profile 'Keys'
    - Ensure that the 'xterm Defaults' preset is on
    - Ensure that both option keys are mapped to Esc+
- In Preferences > Keys
  - Set `Command` + `K` and `Command` + `R` to 'Ignore' in 'Key Mappings'
- In Preferences > Pointer
  - Remove the defaults
- In the iTerm2 menu, select 'Make iTerm2 Default Term'

### openFrameworks

1. Run `git clone --recursive git@github.com:openframeworks/openFrameworks.git` in `~/code/cpp/`
2. Inside the openFrameworks folder run `/bin/bash scripts/osx/download_libs.sh` to download the libraries
