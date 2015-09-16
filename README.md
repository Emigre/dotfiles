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

- Install color theme in Preferences > Profiles > Colors > Load Presets... > Import...
- In Preferences > Appearance
  - Set 'Show tabs in full screen by holding command for' to zero
  - Uncheck 'Color tab labels on activity'
  - Check 'Hide tab activity indicator'
- In Preferences > Profiles > Terminal
  - Uncheck 'Show bell icon in tabs', 'Flash visual bell' and 'Silence bell'
- Remap keys in Preferences > Profiles > Keys
  - alt + left: send ESC + b
  - alt + right: send ESC + f
  - alt + backspace: send HEX sequence “0x1B 0x08"

##### TotalSpaces2
- Go to System Preferences > Keyboard > Shortcuts and uncheck 'Mission Control'
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

##### OSX Preferences
- Check Preferences > Trackpad > Tap to click
- Select 'three finger drag' in System Preferences > Accessibility > Mouse & Trackpad > Trackpad Options... > Enable dragging

##### XCode
https://developer.apple.com/xcode/

##### Alcatraz for XCode
http://alcatraz.io/

##### OpenFrameworks
http://openframeworks.cc/

##### Eclipse
https://www.eclipse.org/downloads/

##### Adobe
http://www.adobe.com/

##### Cinema 4D
http://www.maxon.net/

##### Postman
https://www.getpostman.com/

##### GifGrabber
http://www.gifgrabber.com/
