#!/bin/bash

brew cask install virtualbox
brew cask install vagrant
vagrant box add "Windows 7 with IE8 (32bit)" http://aka.ms/vagrant-win7-ie8
vagrant box add "Windows 7 with IE9 (32bit)" http://aka.ms/vagrant-win7-ie9
vagrant box add "Windows 7 with IE10 (32bit)" http://aka.ms/vagrant-win7-ie10
vagrant box add "Windows 8.1 with IE11 (32bit)" http://aka.ms/vagrant-win81-ie11
