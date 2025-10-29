#!/bin/bash

dotdir="$HOME/.git/dotfiles"

# Setup SSH
mkdir -p "$HOME/.ssh"
chmod 0700 "$HOME/.ssh"
curl "https://raw.githubusercontent.com/mrbene93/dotfiles/refs/heads/master/.ssh/id_ed25519_ecker-privat.enc" | openssl enc -d -aes-256-cbc -out "$HOME/.ssh/id_ed25519_ecker-privat" -pbkdf2 -iter 100000
chmod 0600 "$HOME/.ssh/id_ed25519_ecker-privat"
ssh-keygen -y -f "$HOME/.ssh/id_ed25519_ecker-privat" > "$HOME/.ssh/id_ed25519_ecker-privat.pub"
cat "$HOME/.ssh/id_ed25519_ecker-privat.pub" > "$HOME/.ssh/authorized_keys"
chmod 0600 "$HOME/.ssh/authorized_keys"
curl -o "$HOME/.ssh/config" "https://raw.githubusercontent.com/mrbene93/dotfiles/refs/heads/master/.ssh/config"

# Pull dotfiles repo
if [[ ! -d $dotdir ]]
then
    git clone git@github.com:mrbene93/dotfiles.git $dotdir
fi

# Create directories
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/btop"
mkdir -p "$HOME/.config/MangoHud"
mkdir -p "$HOME/.config/pipewire"


# Create symlinks
ln -s "$dotdir/.abcde.conf" "$HOME/.abcde.conf"
ln -s "$dotdir/.gitconfig" "$HOME/.gitconfig"
ln -s "$dotdir/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$dotdir/.vimrc" "$HOME/.vimrc"
ln -s "$dotdir/.zshenv" "$HOME/.zshenv"
ln -s "$dotdir/.zshrc" "$HOME/.zshrc"
ln -s "$dotdir/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -s "$dotdir/.config/btop/btop.conf" "$HOME/.config/btop/btop.conf"
ln -s "$dotdir/.config/MangoHud/MangoHud.conf" "$HOME/.config/MangoHud/MangoHud.conf"
ln -s "$dotdir/.config/mc" "$HOME/.config/mc"
ln -s "$dotdir/.config/pipewire/pipewire.conf" "$HOME/.config/pipewire/pipewire.conf"
ln -s "$dotdir/.config/starship.toml" "$HOME/.config/starship.toml"

# Change default shell to zsh
chsh -s "$(which zsh)" $USER
