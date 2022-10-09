#!/usr/bin/env bash

# ===================================
#        Deploy config files
# ===================================

set -euxo pipefail

# Gitconfig
rm -f ~/.gitconfig
ln -s $PWD/.config/git/.gitconfig ~/.gitconfig

# Alacritty
rm -f ~/.config/alacritty/alacritty.yml
ln -s $PWD/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# i3
rm -f ~/.i3/config
ln -s $PWD/.config/i3/config ~/.i3/config

# picom
rm -f ~/.config/picom.conf
ln -s $PWD/.config/picom/picom.conf ~/.config/picom.conf

# wallpapers
rm -rf ~/wallpapers
ln -s $PWD/wallpapers/ ~/

# Ulauncher
rm -rf ~/.config/ulauncher
ln -s $PWD/.config/ulauncher ~/.config/

# Zsh
rm -f ~/.zshrc
ln -s $PWD/.config/zsh/.zshrc ~/.zshrc

# Polybar
rm -rf ~/.config/polybar
ln -s $PWD/.config/polybar ~/.config/
