# Aliases
if [[ $(uname) == "FreeBSD" ]]; then
    alias ll="ls -lh --color=auto"
    alias la="ls -lha --color=auto"
    alias lr="ls -lhaR --color=auto"
    alias top="top -s1"
elif [[ $(uname) == "Darwin" ]]; then
    alias ll="ls -lhG"
    alias la="ls -lhaG"
    alias lr="ls -lhaGR"
    alias top="top -s1"
else
    alias ll="ls -lh --file-type --color=auto --group-directories-first"
    alias la="ls -lha --file-type --color=auto --group-directories-first"
    alias lr="ls -lhaR --file-type --color=auto --group-directories-first"
    alias top="top -d 1"
fi
alias ..="cd .."
alias df="df -h"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias htop="htop -d 10"
alias free="free -h"
alias lsblk="lsblk -o NAME,RM,RO,TYPE,SIZE,FSTYPE,MODEL,MOUNTPOINT,LABEL"
alias lsusb="lsusb -t"
alias pgrep="pgrep -l"
alias salias="alias | grep"
alias sudo="sudo --preserve-env=PATH"
alias tmux="tmux -f $OHOME/.tmux.conf"
alias vim="vim -u $OHOME/.vimrc"
alias zfssnaps='snaps=0; for snap in $(zfs list -rt filesystem -Hpo usedsnap); do snaps=$((snaps + $snap)); done; echo $snaps'

# Shell functions
zfs() {
    if [[ $1 == "list" ]]; then
        command zfs list -o name,type,used,usedbysnapshots,refer,avail,compressratio,mounted ${@:2:$#}
    else
        command zfs "$@"
    fi
}

# Key bindings
typeset -g -A key
bindkey -e
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Completion
autoload -U compinit
compinit
zstyle ':completion:*' menu select

# Shared history
setopt SHARE_HISTORY

# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# dircolors
eval "$(dircolors -b)"

# Launch Starship
eval "$(starship init zsh)"
