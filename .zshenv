export SHELL="$(which zsh)"
export HISTSIZE=131072
export SAVEHIST=1048576
export TERM="xterm-256color"
export LANG="de_DE.UTF-8"
if [[ $(whoami) == "root" ]]
then
    export OHOME="$(eval echo ~$SUDO_USER)"
else
    export OHOME="$(eval echo ~$USER)"
fi
export DOTDIR="$OHOME/.git/dotfiles"
export HISTFILE="$OHOME/.zsh_history"
export HTOPRC="$OHOME/.config/htop/htoprc"
export VISUAL="vim"
export TAPE='/dev/nst0'
