##### Homebrew

http://brew.sh/

To clean up

```
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
```

##### npm
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

##### XCode
https://developer.apple.com/xcode/

##### Alcatraz for XCode
http://alcatraz.io/

##### Eclipse
https://www.eclipse.org/downloads/

##### JDK
http://www.oracle.com/technetwork/java/javase/downloads/index.html

##### Postman
https://www.getpostman.com/

##### GifGrabber
http://www.gifgrabber.com/
