#!/bin/bash

# OSX
mkdir -p ~/.ssh
ln -f -s ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
ln -f -s ~/Dropbox/dotfiles/config ~/.ssh/config

# git
ln -f -s ~/Dropbox/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/Dropbox/dotfiles/.gitignore_global ~/.gitignore_global
ln -f -s ~/Dropbox/dotfiles/.git-completion.bash ~/.git-completion.bash

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
ln -f -s ~/Dropbox/dotfiles/.vimrc.buftabline ~/.vimrc.buftabline

# Sublime Text
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
ln -f -s ~/Dropbox/dotfiles/Default.sublime-theme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default.sublime-theme
ln -f -s ~/Dropbox/dotfiles/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -f -s ~/Dropbox/dotfiles/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -f -s ~/Dropbox/dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -f -s ~/Dropbox/dotfiles/MoveCaret.py ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/MoveCaret.py
ln -f -s ~/Dropbox/dotfiles/sublime/C++/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/C++/
ln -f -s ~/Dropbox/dotfiles/sublime/CSS/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/CSS/
ln -f -s ~/Dropbox/dotfiles/sublime/Java/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Java/
ln -f -s ~/Dropbox/dotfiles/sublime/JavaScript/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript/
ln -f -s ~/Dropbox/dotfiles/sublime/Python/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Python/
ln -f -s ~/Dropbox/dotfiles/sublime/Ruby/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Ruby/
