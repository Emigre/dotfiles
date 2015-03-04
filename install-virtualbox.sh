#!/bin/bash

brew cask install virtualbox
brew cask install vagrant
vagrant box add "Windows 7 with IE8 (32bit)" http://aka.ms/vagrant-win7-ie8
vagrant box add "Windows 7 with IE9 (32bit)" http://aka.ms/vagrant-win7-ie9
