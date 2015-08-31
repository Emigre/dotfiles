#!/bin/bash

brew install vim

mkdir -p ~/.vim
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/plugin
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
