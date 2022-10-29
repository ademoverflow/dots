#!/usr/bin/env bash

# ===================================
# Setup procedure to a fresh install
# ===================================

# Update packages sources
sudo pacman -Sy

sudo pacman -S unzip
sudo pacman -S yay
sudo pacman -S feh

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

# Install ulauncher
git clone https://aur.archlinux.org/ulauncher.git && cd ulauncher && makepkg -is

# Install bluetooth
sudo pacman -S bluez
sudo pacman -S bluez-utils
sudo pacman -S blueman
sudo systemctl enable bluetooth.service 

# Install and configure audio
sudo pacman -S pulseaudio
sudo pacman -S pulseaudio-alsa
sudo pacman -S pavucontrol
yay -S indicator-sound-switcher
# Follow https://forum.manjaro.org/t/nvidia-drivers-seem-to-not-be-working/73598/15 to enable HDMI output via NVIDIA

# Install grub theme
# Use this repo: https://github.com/stuarthayhurst/argon-grub-theme
mkdir -p ~/apps
git clone git@github.com:stuarthayhurst/argon-grub-theme.git apps/argon-grub-theme
sudo ./apps/argon-grub-theme/install.sh -i --background Grey --fontsize 16    

# Install font awesome
sudo pacman -S ttf-font-awesome 

# Install code
sudo pacman -S code
pamac install flac lib32-flac
# Reboot after

# Install Nautilus
sudo pacman -S nautilus

# Change Xresources to dpi: 120

# Install NoiseTorch
wget https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz
tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz

# Install evdi and displaylink
yay -S evdi
yay -S displaylink