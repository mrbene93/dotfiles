#!/bin/bash

dotdir="$HOME/.git/dotfiles"

# Get Operating System Name
OS=$(awk -F= '/^NAME=/ {print $2}' /etc/os-release | tr -d '"')

# CachyOS
if [[ "$OS" == "CachyOS Linux" ]]
then
    sudo pacman -Sy --noconfirm pro-audio alsa-scarlett-gui bitwig-studio reapack yabridgectl
fi

# Symlinks
mkdir -p "$HOME/.local/share/applications"
ln -s "$dotdir/.local/share/applications/com.bitwig.BitwigStudio.desktop" "$HOME/.local/share/applications/com.bitwig.BitwigStudio.desktop"
