# basic
ZSH_THEME="flazz"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
ZSH_DISABLE_COMPFIX="true"
ZSH_CUSTOM="$DOTFILES/zsh_custom"

# tmux
ZSH_TMUX_AUTOSTART="false"
ZSH_TMUX_AUTOSTART_ONCE="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_FIXTERM="true"

# plugins
plugins=(colored-man-pages git git-extras rsync themes tmux wd zsh-dircolors-solarized)

# load all the stuff
source $ZSH/oh-my-zsh.sh

# aliases
unalias	l
unalias	la
unalias	lsa
if [[ $(uname) == "FreeBSD" ]]; then
    alias ll="ls -lh --color=always"
    alias la="ls -lha --color=always"
    alias findports="find /usr/ports/ -type d -name"
else
    alias ll="ls -lh --file-type --color=always --group-directories-first"
    alias la="ls -lha --file-type --color=always --group-directories-first"
fi
alias df="df -h"
alias docker-cleanup="docker container prune -f; docker volume prune -f; docker network prune -f"
alias grep="grep --color=always"
alias htop="htop -d 10"
alias free="free -h"
alias lsblk="lsblk -o NAME,RM,RO,TYPE,SIZE,FSTYPE,MODEL,MOUNTPOINT,LABEL"
alias lsusb="lsusb -t"
alias salias="alias | grep"
alias sudoz="sudo -s -u root ZDOTDIR=$OHOME zsh"
alias tmux="tmux -f $DOTFILES/.tmux.conf"
alias top="top -d 1"
alias vim="vim -u $DOTFILES/.vimrc"
