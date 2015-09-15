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

##### Java
http://www.oracle.com/technetwork/java/javase/downloads/

__JDK__

Java SE 6

https://support.apple.com/kb/DL1572

Java SE 7

http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html

Java SE 8

http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

##### iTerm2

Download Homebrew theme
http://iterm2colorschemes.com/

- Set 'Show tabs in full screen by holding command for' to zero
- Uncheck 'Color tab labels on activity'
- Check 'Hide tab activity indicator'

#### TotalSpaces2

- Go to System Preferences > Keyboard > Shortcuts and uncheck 'Mission Control'

#### vim

- After installation, run `:InstallPlugins`

#### Sublime Text 2

- Select View > Hide Status Bar

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
