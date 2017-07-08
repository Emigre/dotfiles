##### Usage

```
ansible-playbook main.yml

```
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
brew update
```

To clean up

```
brew update && brew cleanup && brew cask cleanup
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

##### MIT Scheme
```
ln -s /usr/local/opt/readline/lib/libreadline.7.dylib /usr/local/opt/readline/lib/libreadline.6.dylib
```

##### RVM
https://rvm.io/

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

- In Preferences > General
  - Check 'Load preferences from a custom folder or URL' and set it to `/Users/gasparrey/.iterm.d`
  - Check 'Save changes to folder when iTerm2 quits'
- In Preferences > Profiles
  - Select 'My Profile' and 'Set as Default' in the 'Other Actions...' menu
  - In the profile keys, ensure that the 'xterm Defaults' preset is on, that alt-left sends ESC + [1;5D and alt-right ESC + [1;5C
  - In the profile keys, make the Ctrl and number combination send a space and that number as text
- In Preferences > Pointer
  - Remove the defaults
  - Add "Three-finger Tap" to "Send Text \e:w\n"

##### Terminal
- In Preferences > Profiles > Keyboard select 'Use Option as Meta key'

##### VirtualBox
- In Machine > Settings > General > Advanced select 'Bidirectional' in 'Shared Clipboard'

##### Docker for Mac Beta

https://docs.docker.com/docker-for-mac/

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
- After installation, run `:PluginInstall`
- `:PluginList` lists configured plugins
- `:PluginInstall` installs plugins, append `!` to update
- `:PluginUpdate` same as `:PluginInstall!`
- `:PluginSearch foo` searches for foo, append `!` to refresh local cache
- `:PluginClean` confirms removal of unused plugins, append `!` to auto-approve removal

##### Eclim
http://eclim.org/

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
  - Check Trackpad > Tap to click
  - Set Require password 'immediately' after sleep in  Security & Privacy
  - Select 'three finger drag' in Accessibility > Mouse & Trackpad > Trackpad Options... > Enable dragging
  - In Dock
    - Select the right dock size and magnification
    - Check 'Minimize windows into application icon'
    - In 'Minimize windows using:' select 'scale effect'
  - In Accessibility
    - Zoom toggle it all
    - In Mouse & Trackpad, check Enable Dragging and select Finger Dragging
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

##### Adobe
http://www.adobe.com/

##### Affinity Photo
https://affinity.serif.com/

##### Fusion
https://www.blackmagicdesign.com/

##### Pure Data
http://puredata.info/

##### Manga Studio
http://my.smithmicro.com/

##### Postman
https://www.getpostman.com/

##### GifGrabber
http://www.gifgrabber.com/

##### Cathode and Blinky
http://www.secretgeometry.com/

##### Key Codes
https://manytricks.com/keycodes/

##### OpenGL Extensions Viewer
http://realtech-vr.com/admin/glview
