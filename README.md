##### Homebrew

http://brew.sh/

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

##### XCode
https://developer.apple.com/xcode/

##### Alcatraz for XCode
http://alcatraz.io/

##### OpenFrameworks
http://openframeworks.cc/

##### Eclipse
https://www.eclipse.org/downloads/

##### JDK
http://www.oracle.com/technetwork/java/javase/downloads/

##### Adobe
http://www.adobe.com/

##### Cinema 4D
http://www.maxon.net/

##### Postman
https://www.getpostman.com/

##### GifGrabber
http://www.gifgrabber.com/
