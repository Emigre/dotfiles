#!/bin/bash

# OSX
ln -f -s ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
ln -f -s ~/Dropbox/dotfiles/config ~/.ssh/config

# git
ln -f -s ~/Dropbox/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/Dropbox/dotfiles/.gitignore_global ~/.gitignore_global
ln -f -s ~/Dropbox/dotfiles/.git-completion.bash ~/.git-completion.bash

# npm
ln -f -s ~/Dropbox/dotfiles/.npmrc ~/.npmrc

# Vim
ln -f -s ~/Dropbox/dotfiles/.vimrc ~/.vimrc
ln -f -s ~/Dropbox/dotfiles/.vimrc.vundle ~/.vimrc.vundle
ln -f -s ~/Dropbox/dotfiles/.vimrc.basic ~/.vimrc.basic
ln -f -s ~/Dropbox/dotfiles/.vimrc.nerdtree ~/.vimrc.nerdtree
ln -f -s ~/Dropbox/dotfiles/.vimrc.ctrlp ~/.vimrc.ctrlp
ln -f -s ~/Dropbox/dotfiles/.vimrc.bufexplorer ~/.vimrc.bufexplorer
ln -f -s ~/Dropbox/dotfiles/.vimrc.nerdcommenter ~/.vimrc.nerdcommenter
ln -f -s ~/Dropbox/dotfiles/.vimrc.ultisnips ~/.vimrc.ultisnips
ln -f -s ~/Dropbox/dotfiles/.vimrc.indentline ~/.vimrc.indentline

# Sublime Text
ln -f -s ~/Dropbox/dotfiles/Default.sublime-theme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default.sublime-theme
ln -f -s ~/Dropbox/dotfiles/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -f -s ~/Dropbox/dotfiles/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -f -s ~/Dropbox/dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -f -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript
ln -f -s ~/Dropbox/dotfiles/JSON.tmLanguage ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript/JSON.tmLanguage
