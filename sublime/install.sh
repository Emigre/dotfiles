#!/bin/bash

brew tap caskroom/versions
brew cask install sublime-text3

ln -f -s ~/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/C++
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/CSS
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Java
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Python
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Ruby

cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
git clone git://github.com/wbond/sublime_package_control.git Package\ Control
