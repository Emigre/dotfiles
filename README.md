# Dotfiles

## Usage

1. Install [homebrew](https://brew.sh/)

2. Install Chrome: `brew cask install google-chrome`

3. Install [LastPass](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd)

4. Log in to LastPass and Chrome

5. Install and activate caffeine: `brew cask install caffeine`

6. Install Ansible and git: `brew install ansible git`

7. [Set up SSH access to GitHub](SSH.md)

8. Clone the dotfiles repo `git clone git@github.com:Emigre/dotfiles.git ~/dotfiles`

9. Run `make start` in the `dotfiles` folder

## Other

* Refer to the vim repo README to fix issues with autocomplete in coc.nvim

* [Set up e-mail accounts with Mutt](MUTT.md)

* Start [docker for mac](https://www.docker.com/products/docker-desktop), [dropbox](https://www.dropbox.com/) and the [mail notifr](https://ashchan.com/projects/gmail-notifr)

### OSX Preferences

- In System Preferences
  - In Keyboard
    - Under Shortcuts uncheck 'Mission Control'
    - Click on 'Modifier Keys...' and Select '^ Control' for the 'Caps Lock Key'
  - In Trackpad
    - Enable 'Tap to click'
  - In Security & Privacy
    - Consider setting Require password 'immediately' after sleep
  - In Dock
    - Select the right dock size and magnification
    - Check 'Minimize windows into application icon'
    - In 'Minimize windows using:' select 'scale effect'
  - In Accessibility
    - In Mouse & Trackpad, under Trackpad Options, check 'Enable dragging' and select 'three finger drag'
    - In Display, enable 'Reduce motion' and disable 'Shake mouse pointer to locate'
  - In Mission Control deselect 'Show Desktop' and 'Show Dashboard'
  - In Bluetooth select 'Show Bluetooth in menu bar'
  - In Volume select 'Show volume in menu bar'
  - In Time Machine select 'Show Time Machine in menu bar'

#### iTerm2

- In Preferences > General
  - Check 'Load preferences from a custom folder or URL' and set it to `/Users/gasparrey/.iterm2.d`
  - Check 'Save changes to folder when iTerm2 quits'
- In Preferences > Profiles
  - In the 'Window' menu, select 'Full-Height Left of Screen' in the 'Style' selector
  - In the profile keys, ensure that the 'xterm Defaults' preset is on, that alt-left sends ESC + [1;5D and alt-right ESC + [1;5C
- In Preferences > Keys
  - Set `Command` + `K` and `Command` + `R` to 'Ignore' in 'Key Mappings'
- In Preferences > Pointer
  - Remove the defaults
