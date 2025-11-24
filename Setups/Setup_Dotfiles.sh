#!/bin/bash


# Variables
dotdir="$HOME/.git/dotfiles"    # Directory which should contain my dotfiles git repository
usershell='zsh'                 # Which shell to set as default
packages=(                      # Required packages to run the script
    "curl"
    "git"
    "openssh"
)
directories=(                   # Directories to create
    ".config"
    ".config/alacritty"
    ".config/btop"
    ".config/MangoHud"
    ".config/systemd/user"
    ".config/superfile"
    ".config/tmux"
    ".local/share/icons"
    ".vim"
)
symlinks=(                      # Symlinks to create
    ".abcde.conf"
    ".fluxbox"
    ".gitconfig"
    ".ncmpcpp"
    ".tmux.conf"
    ".vimrc"
    ".vim/colors"
    ".zshenv"
    ".zshrc"
    ".config/alacritty/alacritty.toml"
    ".config/btop/btop.conf"
    ".config/fuzzel"
    ".config/herbstluftwm"
    ".config/hypr"
    ".config/MangoHud/MangoHud.conf"
    ".config/mc"
    ".config/systemd/user/alacritty.service"
    ".config/starship.toml"
    ".config/superfile/config.toml"
    ".config/superfile/hotkeys.toml"
    ".config/superfile/theme"
    ".config/tmux/tmux.conf"
    ".local/share/icons/Bibata-Modern-Ice"
    "Wallpaper"
)


# Get Operating System Name
OS=$(awk -F= '/^NAME=/ {print $2}' /etc/os-release | tr -d '"')

# Ensure required packages are installed
if [[ "$OS" == "Arch Linux" || "$OS" == "CachyOS Linux" ]]
then
    sudo pacman -Sy --needed --noconfirm ${packages[@]}
elif [[ "$OS" == "Fedora Linux" ]]
then
    sudo dnf install --assumeyes ${packages[@]}
fi

# Setup SSH
if [[ ! -s "$HOME/.ssh/id_ed25519_ecker-privat" ]]
then
    echo "Private SSH-Key not found. Please configure SSH correctly and restart the script."
    exit 1
fi
if [[ ! -s "$HOME/.ssh/config" ]]
then
    curl -o "$HOME/.ssh/config" "https://raw.githubusercontent.com/mrbene93/dotfiles/refs/heads/master/.ssh/config"
fi

# Pull dotfiles repo
if [[ ! -d $dotdir ]]
then
    git clone git@github.com:mrbene93/dotfiles.git $dotdir
    git -C $dotdir submodule update --init --recursive $dotdir
fi

# Create directories
for directory in ${directories[@]}
do
    mkdir -p "$HOME/$directory"
done


# Create symlinks
for symlink in ${symlinks[@]}
do
    ln -sf "$dotdir/$symlink" "$HOME/$symlink"
done

# Set Home directory permissions
chmod 0750 $HOME

# Change default shell to zsh
chsh -s "$(which $usershell)" $USER
