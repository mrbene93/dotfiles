export SHELL="$(which zsh)"
export HISTSIZE="100000"
export TERM="xterm-256color"
export LANG="de_DE.UTF-8"
if [[ $(whoami) == "root" ]]
then
    export OHOME="$(eval echo ~$SUDO_USER)"
else
    export OHOME="$(eval echo ~$USER)"
fi
export GIT="/usr/repos"
export DOTFILES="$GIT/dotfiles"
#export ZSH="$DOTFILES/oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"
export VISUAL="vim"
