#!/bin/bash


# Variables
dotdir="$HOME/.git/dotfiles"

# Install packages
# CachyOS
if [[ "$OS" == "CachyOS Linux" ]]
then
    sudo pacman -Sy --needed --noconfirm sddm
fi

# Link config files
sudo ln -sf "$dotdir/etc/sddm.conf" "/etc/sddm.conf"

# Adding user sddm to primary group of currently logged in user
pgid=$(id -g)
usermod --append --groups $pgid sddm

# Enable Services
sudo systemctl enable --now sddm.service
