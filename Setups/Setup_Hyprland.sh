#!/bin/bash

# Get Operating System Name
OS=$(awk -F= '/^NAME=/ {print $2}' /etc/os-release | tr -d '"')

# CachyOS
if [[ "$OS" == "CachyOS Linux" ]]
then
    sudo pacman -Sy --noconfirm fuzzel hyprcursor hypridle hyprland hyprlock hyprpaper hyprpicker hyprpolkitagent hyprshot hyprsunset noto-fonts nwg-displays pipewire pipewire-alsa pipewire-audio pipewire-docs pipewire-jack pipewire-pulse qt5-quickcontrols2 qt6-svg qt6-declarative sddm swaync waybar wiremix wireplumber wireplumber-docs xdg-desktop-portal-hyprland
fi

