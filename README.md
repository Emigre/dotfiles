# Dotfiles

1. Install [homebrew](https://brew.sh/) and then git, Ansible and Firefox with it: `brew cask install git ansible firefox`. In Firefox, install and log in to the LastPass and Raindrop extensions

2. Configure access to GitHub, clone the dotfiles repo `git clone git@github.com:Emigre/dotfiles.git $HOME/dotfiles`

3. In the dotfiles folder and run `make dotfiles` and then `make apps` to install the software

4. Manually set up the system preferences, Firefox and iTerm

5. Run other targets in the dotfiles folder to configure each desired programming language

6. Clone the [vim repo](https://github.com/Emigre/vim) and configure Neovim following the instructions in the README

7. If necessary install other applications that have not had their installation automated, like the Adobe Creative Suite, Steam or Unity

## Firefox

Install the following extensions: - LastPass - Raindrop.io

In the Preferences section:

- Home:
  - Set New Tabs to Blank Page
  - Unselect everything except Web search for Firefox Home Content
- Search:
  - Set Default Search Engine to DuckDuckGo
- Privacy & Security:
  - Set to Strict
  - Set "Do Not Track" to Always
  - Select Delete cookies and site data when Firefox is closed
  - In Logins and Passwords, unselect Ask to save logins and passwords for web sites and Use a master password
  - In History, select Use Custom Settings:
    - Select Clear history when Firefox closes
    - Deselect the rest
  - In Address Bar, deselect all
  - In Permissions, ensure that Block pop-up windows and the rest are selected
    - In the Notifications Settings, select Block new requests asking to allow notifications
  - In Firefox Data Collection and Use, do not allow

## Set up access to GitHub

1. Generate a ssh key: `ssh-keygen -t rsa -b 4096 -C "info@gasparrey.com"`

2. Start the ssh agent: `eval "$(ssh-agent -s)"`

3. Add the following `~/.ssh/config` file:

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```

4. Add the ssh key to the ssh agent `ssh-add -K ~/.ssh/id_rsa`

5. Copy the public key `cat ~/.ssh/id_rsa.pub | pbcopy`

6. [Add the key to github](https://github.com/settings/keys) / [Add the key to bitbucket](https://bitbucket.org/account/user/Emigre/ssh-keys/)

7. Create `~/.gituser` with the git user name and email

```
[user]
  name = <name>
  email = <email>
```

## iTerm

- In Preferences > General
  - In Preferences
    - Check 'Load preferences from a custom folder or URL' and set it to `~/.iterm2.d/`
    - Check 'Save changes to folder when iTerm2 quits'
  - In Selection
    - Check 'Applications in terminal may access clipboard'
  - In Closing
    - Uncheck everything
- In Preferences > Appearance
  - In General
    - Select the 'Minimal' Theme
- In Preferences > Profiles
  - In General
    - Set 'Send text at start' to `tmux attach -t init || tmux new -s init`
  - In Colors
    - Select the 'Dark Background' color preset
    - Set 'Foreground' and 'Bold' to `00f900`, 'Cursor' to `07f91d` and 'Selection' to `004703`, or whatever looks good in the screen
  - In Text
    - Set 'Font' to `Meslo LG M`, size 10 or whatever looks good in the screen
  - In Window
    - In Settings for New Windows, set Columns to 180 and Rows to 40, or whatever looks good in the screen
  - In Terminal
    - Check 'Silence bell'
  - In Keys
    - Ensure that the 'xterm Defaults' preset is on
    - Ensure that both option keys are mapped to Esc+
- In Preferences > Keys > Key Bindings
  - Set Cmd + r and Cmd + k to 'Ignore'
  - Delete Cmd + Up, Cmd + Down, Ctrl + Left and Ctrl + Right
- In Preferences > Pointer
  - In Bindings
    - Remove the defaults
- In Preferences > Advanced
  - Set 'Scroll wheel sends arrow keys when in alternate screen mode' to 'Yes'
- In the iTerm2 menu, select 'Make iTerm2 Default Term'

## OSX

### zshell Setup

- To update the account to use zsh, run `chsh -s /bin/zsh`. For more details: https://support.apple.com/kb/HT208050.

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
