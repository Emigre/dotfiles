#!/bin/bash

cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
git clone git://github.com/wbond/sublime_package_control.git Package\ Control

mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/C++
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/CSS
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Java
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Python
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Ruby

ln -f -s ~/Dropbox/dotfiles/sublime/User/Default.sublime-theme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default.sublime-theme
ln -f -s ~/Dropbox/dotfiles/sublime/User/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -f -s ~/Dropbox/dotfiles/sublime/User/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -f -s ~/Dropbox/dotfiles/sublime/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -f -s ~/Dropbox/dotfiles/sublime/User/MoveCaret.py ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/MoveCaret.py

ln -f -s ~/Dropbox/dotfiles/sublime/C++/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/C++/
ln -f -s ~/Dropbox/dotfiles/sublime/CSS/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/CSS/
ln -f -s ~/Dropbox/dotfiles/sublime/Java/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Java/
ln -f -s ~/Dropbox/dotfiles/sublime/JavaScript/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript/
ln -f -s ~/Dropbox/dotfiles/sublime/Python/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Python/
ln -f -s ~/Dropbox/dotfiles/sublime/Ruby/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Ruby/