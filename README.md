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

To update

```
brew update && brew upgrade brew-cask
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

To clean up

```
sudo npm cache clean -f
```

To update

```
sudo npm install npm -g
```

##### n

```
sudo n 0.10.40
sudo n 0.12.5
sudo n 4.0.0
```

##### Java JDK

Install with [Homebrew Cask](http://caskroom.io/) and manage with [jEnv](http://www.jenv.be/)

###### Java SE 6
`jenv add /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home`

###### Java SE 7
`jenv add /Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home`

###### Java SE 8
`jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home`

To list available Java versions:

```
jenv versions
```

Configure global version

```
jenv global 1.7
```

Configure local version (per directory)

```
jenv local 1.7
```

Configure shell instance version

```
jenv shell 1.7
```

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
- In Preferences > Profiles > General
  - Check 'Reuse previous session's directory' in Working Directory
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

##### VirtualBox

- In Machine > Settings > General > Advanced select 'Bidirectional' in 'Shared Clipboard'

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

##### Sublime Text 3
- Select View > Hide Status Bar

##### JetBrain IDEs
- Uncheck 'Toolbar', 'Tool Buttons', Status Bar' and 'Navigation Bar' in View
- In Preferences > Keymap
  - Assign cmd + 0 to Other > Terminal
  - In IntelliJ IDEA, assign cmd + 8 to Other > Database
- In Preferences > Editor
  - In File Types
    - Add ".idea;\*.iml" to Ignore files and folders
  - In General
    - Check 'Use soft wraps in editor'
    - Under Appearance
      - Uncheck 'Show right margin'
      - Uncheck 'Show line numbers'
      - Check 'Show whitespaces' if you want to show tabs vs spaces
- In Preferences > Version Control > git
  - Uncheck 'Control repositories synchronously'

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
  - In Accessibility > Zoom toggle it all
  - In Mission Control deselect 'Show Desktop:' and 'Show Dashboard:'

Disable bouncing animation

```
defaults write com.apple.dock no-bouncing -bool TRUE
killall Dock
```

##### XCode
https://developer.apple.com/xcode/

```
xcode-select --install
```

Will install the command-line tools.

##### OpenFrameworks
http://openframeworks.cc/

##### Cling
https://root.cern.ch/cling

##### Eclipse
https://www.eclipse.org/downloads/

- Select Window > Hide Toolbar
- In Preferences
  - In General > Appearance
    - In Color Theme select 'Zenburn'
    - In Colors and Fonts set 'Orchid' as the color for 'Uncommited Change'
  - In General > Editors > Text Editors
    - Uncheck 'Show line numbers' and 'Show print margin'
    - Check 'Show whitespace characters'
    - In Quick Diff, select 'A Git Revision' in the dropdown
  - In General > Keys
    - Set Ctrl + Tab for 'Show View (Project Explorer)'
    - Set Ctrl + Tab for 'Activate Editor'
  - In Java > Apearance check Abbreviate package names and set the package abbreviations
  - In Team > Git > Label Decorations
    - Under Icon Decorations, unselect Tracked Resources and Dirty resources
    - Under Text Decorations, set Files: {name}, Folders: {name} and Projects: {name}  [{branch}{ branch_status}]

Install the [Lightweight CSS Editor plugin](https://marketplace.eclipse.org/content/eclipse-4-tools-lightweight-css-editor) and add these styles in Preferences > General > Appearance

```css
#org-eclipse-e4-ui-compatibility-editor Composite > Canvas { background-color: #232323; }
Tree, List, Table { background-color: #eee; }
```

##### Adobe
http://www.adobe.com/

##### Cinema 4D
http://www.maxon.net/

##### Pure Data
http://puredata.info/

##### Manga Studio
http://my.smithmicro.com/

##### Rosetta Stone
http://www.rosettastone.eu/

##### Postman
- Select the dark theme in Preferences

##### GifGrabber
http://www.gifgrabber.com/

