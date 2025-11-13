#!/bin/bash

# Get Operating System Name
OS=$(awk -F= '/^NAME=/ {print $2}' /etc/os-release | tr -d '"')

# Arch Linux
if [[ "$OS" == "Arch Linux" || "$OS" == "CachyOS Linux" ]]
then
    sudo pacman -Sy --noconfirm acl at bash bash-completion bat bind-tools btop cmatrix cowsay curl ddrescue diffutils exfatprogs fastfetch findutils fio fortune-mod fzf gnupg grep gzip hdparm htop iftop iperf3 iputils libarchive lm_sensors lolcat lsof lsscsi lz4 mbuffer mc mtr ncdu netcat nvme-cli openssl p7zip parallel perl-rename powertop rsnapshot rsync sl smartmontools starship stress tar tldr tmux traceroute tree udftools unrar wget wipe xxhash yq zip zsh zstd

# Fedora
elif [[ "$OS" == "Fedora Linux" ]]
then
    sudo dnf install --assumeyes dnf-plugins-core https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    dnf copr enable atim/starship
    sudo dnf install -y acl at bash bash-completion bat bind-utils btop cmatrix cowsay curl ddrescue diffutils exfatprogs fastfetch findutils fio fortune-mod fzf gnupg grep gzip hdparm htop iftop iperf3 iputils libarchive lm_sensors lolcat lsof lsscsi lz4 mbuffer mc mtr ncdu netcat nvme-cli openssl p7zip parallel prename powertop rsnapshot rsync sl smartmontools starship stress tar tldr tmux traceroute tree udftools unrar wget wipe xxhash yq zip zsh zstd
fi
