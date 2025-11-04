#!/bin/bash

# Get Operating System Name
OS=$(awk -F= '/^NAME=/ {print $2}' /etc/os-release | tr -d '"')

# Arch Linux
if [[ "$OS" == "CachyOS Linux" ]]
then
    sudo pacman -Sy --noconfirm alacritty borg brave-bin darktable firefox firefox-i18n-de flatpak gamemode gamescope git libreoffice-fresh libreoffice-fresh-de localsend lutris moonlight-qt mpv mullvad-vpn nextcloud-client proton-cachyos protontricks remmina signal-desktop solaar steam sunshine thunderbird thunderbird-i18n-de ttf-cascadia-code-nerd vlc vorta wine-cachyos winetricks
    sudo flatpak install --system --assumeyes flathub com.visualstudio.code net.puddletag.puddletag sh.cider.Cider tv.plex.PlexDesktop
    sudo curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
    sudo git clone https://aur.archlinux.org/1password.git /tmp/1password.git
    cd /tmp/1password.git
    makepkg -sic
    sudo rm -r /tmp/1password.git


# Fedora
elif [[ "$OS" == "Fedora Linux" ]]
then
    sudo dnf install --assumeyes dnf-plugins-core https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
    sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
    sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
    sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
    sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
    sudo dnf install --assumeyes 1password alacritty borgbackup brave-browser cascadia-code-nf-fonts darktable firefox firefox-langpacks flatpak gamemode gamescope libreoffice libreoffice-help-de libreoffice-langpack-de lutris mpv mullvad-vpn nextcloud-client protontricks puddletag remmina solaar steam thunderbird vlc vorta wine winetricks
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    sudo flatpak install --system --assumeyes flathub com.moonlight_stream.Moonlight com.visualstudio.code dev.lizardbyte.app.Sunshine md.obsidian.Obsidian org.localsend.localsend_app org.signal.Signal sh.cider.Cider tv.plex.PlexDesktop
fi
