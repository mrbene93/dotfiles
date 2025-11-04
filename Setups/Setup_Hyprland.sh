#!/bin/bash

# Get Operating System Name
OS=$(awk -F= '/^NAME=/ {print $2}' /etc/os-release | tr -d '"')

# CachyOS
if [[ "$OS" == "CachyOS Linux" ]]
then
    sudo pacman -Sy --noconfirm fuzzel hyprcursor hypridle hyprland hyprlock hyprpaper hyprpicker hyprpolkitagent hyprshot hyprsunset nwg-displays swaync waybar xdg-desktop-portal-hyprland
fi
