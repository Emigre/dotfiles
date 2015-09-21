##### Google Chrome

http://www.google.com/chrome/

##### Dropbox

http://www.dropbox.com/

##### Homebrew

http://brew.sh/

Do this after install

```
sudo chown -R $USER /usr/local/include
```

To clean up

```
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
```

To reset the casks

```
brew untap caskroom/cask && brew tap caskroom/cask
brew untap caskroom/versions && brew tap caskroom/versions
```

##### npm

https://www.npmjs.com/

[Fixing npm permissions](https://docs.npmjs.com/getting-started/fixing-npm-permissions)

To configure a `.node` folder add this to the `.npmrc` file

```
echo prefix=~/.node >> ~/.npmrc
```

And change the owner of these folders

```
sudo chown -R `whoami` ~/.node
sudo chown -R `whoami` ~/.npm
```

##### Java JDK

Install with [Homebrew Cask](http://caskroom.io/) and manage with [jEnv](http://www.jenv.be/)

###### Java SE 6
`jenv add /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home`

###### Java SE 7
`jenv add /Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home`

###### Java SE 8
`jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home`

##### iTerm2

Download Homebrew theme
http://iterm2colorschemes.com/

- In Preferences > General
  - Uncheck Confirm "Quit iTerm2" command
- In Preferences > Appearance
  - Set 'Show tabs in full screen by holding command for' to the max value
  - Uncheck 'Color tab labels on activity'
  - Uncheck 'Show per-pane title bar with split panes'
  - Uncheck 'Show window number'
  - Check 'Dimming affects only text, not background'
  - Set 'Dimming amount' to the max
  - Check 'Hide scrollbar and resize control'
- In Preferences > Profiles > Colors
  - Select Load Presets... > Import... and install the color theme
- In Preferences > Profiles > Text
  - Check 'Blinking cursor'
- In Preferences > Profiles > Text
  - Set Columns to 120 nd Rows to 20 (for example)
  - Adjust Transparency and Blur
- In Preferences > Profiles > Terminal
  - Uncheck 'Show bell icon in tabs' and 'Flash visual bell'
  - Check 'Silence bell'
- In Preferences > Profiles > Keys
  - Set these Profile Shortcut Keys:
    - alt + left: send ESC + b
    - alt + right: send ESC + f
    - alt + backspace: send HEX sequence “0x1B 0x08"
  - Set 'Left option key acts as' '+Esc', and the right one too

##### TotalSpaces2
- Uncheck Preferences > Transitions > Use transitions
- Check Preferences > General > Start TotalSpaces2 at Login

##### Dash
- In Preferences > General
  - Set 'Global search shortcut' as alt + Space
  - Check 'Launch Dash at login'
  - Uncheck 'Show dock icon'
  - Check 'Dismiss main window when I activate a different app'

##### Caffeine
- Check Preferences > Automatically start Caffeine at login
- Uncheck Preferences > Show this message when starting Caffeine

##### vim
- After installation, run `:InstallPlugins`

##### Sublime Text 2
- Select View > Hide Status Bar

##### WebStorm / IntelliJ IDEA
- Uncheck 'Navigation Bar' and 'Status Bar' in View
- Assign cmd + 0 to Preferences > Keymap > Other > Terminal
- In Preferences > Editor > File Types 'Ignore files and folders' add .idea, target and \*.iml
- In Preferences > Editor > General > Appearance uncheck 'Show right margin'

##### OSX Preferences
- In System Preferences
  - In Keyboard
    - Under Shortcuts uncheck 'Mission Control'
    - Under Keyboard check 'Use F1, F2, etc. keys as standard function keys'
  - Check Trackpad > Tap to click
  - Set Require password 'immediately' after sleep in  Security & Privacy
  - Select 'three finger drag' in Accessibility > Mouse & Trackpad > Trackpad Options... > Enable dragging
  - In Dock
    - Select the right dock size and magnification
    - Check 'Minimize windows into application icon'
    - In 'Minimize windows using:' select 'scale effect'

##### XCode
https://developer.apple.com/xcode/

##### Alcatraz for XCode
http://alcatraz.io/

##### OpenFrameworks
http://openframeworks.cc/

##### Eclipse
https://www.eclipse.org/downloads/

- Select 'Dark Theme' in Preferences > General > Appearance
- Select Window > Hide Toolbar

##### Adobe
http://www.adobe.com/

##### Cinema 4D
http://www.maxon.net/

##### Postman
https://www.getpostman.com/

##### GifGrabber
http://www.gifgrabber.com/
