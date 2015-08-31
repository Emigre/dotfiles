#!/bin/bash

brew tap caskroom/versions
brew cask install sublime-text3

ln -f -s ~/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
