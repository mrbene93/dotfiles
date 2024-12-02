#!/bin/bash

dotdir="$HOME/.git/dotfiles"

# Pull dotfiles repo
if [[ ! -d $dotdir ]]
then
    git clone git@github.com:mrbene93/dotfiles.git $dotdir
fi

# Create directories
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/btop"


# Create symlinks
ln -s "$dotdir/.abcde.conf" "$HOME/.abcde.conf"
ln -s "$dotdir/.gitconfig" "$HOME/.gitconfig"
ln -s "$dotdir/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$dotdir/.vimrc" "$HOME/.vimrc"
ln -s "$dotdir/.zshenv" "$HOME/.zshenv"
ln -s "$dotdir/.zshrc" "$HOME/.zshrc"
ln -s "$dotdir/.config/btop/btop.conf" "$HOME/.config/btop/btop.conf"
ln -s "$dotdir/.config/mc" "$HOME/.config/mc"
ln -s "$dotdir/.config/starship.toml" "$HOME/.config/starship.toml"
