#!/bin/bash

# Disable bouncing animation
defaults write com.apple.dock no-bouncing -bool TRUE
killall Dock

