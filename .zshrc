# basic
ZSH_THEME="flazz"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
ZSH_DISABLE_COMPFIX="true"

# tmux
ZSH_TMUX_AUTOSTART="false"
ZSH_TMUX_AUTOSTART_ONCE="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_FIXTERM="true"

# PATH
if [[ $(uname) == "Darwin" ]]; then
    path+=('/Volumes/Programmdaten/texlive/bin/universal-darwin')
else
    path+=('/usr/local/texlive/bin/x86_64-linux')
fi
export PATH

# plugins
plugins=(colored-man-pages dotbare gh git git-extras rsync themes tmux wd)

# load all the stuff
source $ZSH/oh-my-zsh.sh

# aliases
unalias	l
unalias	la
unalias	lsa
if [[ $(uname) == "FreeBSD" ]]; then
    alias ll="ls -lh --color=always"
    alias la="ls -lha --color=always"
    alias lr="ls -lhaR --color=always"
    alias findports="find /usr/ports/ -type d -name"
    alias top="top -s1"
elif [[ $(uname) == "Darwin" ]]; then
    alias ll="ls -lhG"
    alias la="ls -lhaG"
    alias lr="ls -lhaGR"
    alias top="top -s1"
else
    alias ll="ls -lh --file-type --color=always --group-directories-first"
    alias la="ls -lha --file-type --color=always --group-directories-first"
    alias lr="ls -lhaR --file-type --color=always --group-directories-first"
    alias top="top -d 1"
fi
alias bareos-start="service bareos-dir onestart; service bareos-sd onestart; service bareos-fd onestart"
alias bareos-stop="service bareos-fd onestop; service bareos-sd onestop; service bareos-dir onestop"
alias df="df -h"
alias grep="grep --color=always"
alias htop="htop -d 10"
alias free="free -h"
alias lsblk="lsblk -o NAME,RM,RO,TYPE,SIZE,FSTYPE,MODEL,MOUNTPOINT,LABEL"
alias lsusb="lsusb -t"
alias pgrep="pgrep -l"
alias salias="alias | grep"
alias sudoz="sudo --preserve-env=PATH -u root ZDOTDIR=$OHOME zsh"
alias sudo="sudo --preserve-env=PATH"
alias tmux="tmux -f $OHOME/.tmux.conf"
alias vim="vim -u $OHOME/.vimrc"

# shell functions
docker() {
    if [[ $@ == "cleanup" ]]; then
        command docker container prune -f; docker volume prune -f; docker network prune -f
    else
        command docker "$@"
    fi
}
zfs() {
    if [[ $1 == "list" ]]; then
        command zfs list -o name,type,used,usedbysnapshots,refer,avail,compressratio,mounted ${@:2:$#}
    else
        command zfs "$@"
    fi
}
