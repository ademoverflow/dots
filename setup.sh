#!/usr/bin/env bash

# ===================================
# Setup procedure to a fresh install
# ===================================

# Update packages sources
sudo pacman -Sy

sudo pacman -S unzip

# Load nvidia-settings
sudo mv nvidia-settings/xorg.conf /etc/X11/xorg.conf.d/90-mhwd.conf

# Install brave
sudo pacman -S brave-browser

# Install zsh and themes
sudo pacman -S zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/g'

# Install fonts
sudo cp fonts/* /usr/share/fonts
fc-cache

# Install alacritty terminal
sudo pacman -S alacritty

# Install polybar
sudo pacman -S polybar

