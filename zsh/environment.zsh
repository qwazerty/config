# Set the editor to vim
export EDITOR='vim'

# Set the pager to vimpager if exist
if [ -e /usr/bin/vimpager ]; then
    export PAGER='vimpager'
else
    export PAGER='less'
fi

# Set language to en_US.utf8
export LC_ALL=en_US.utf8

# Set default language to LC_ALL value
export LANG="$LC_ALL"

# Set TERMINAL for i3-sensible-terminal
export TERMINAL=urxvt

if [ -n "$TMUX" ]; then
    export TERM=screen-256color
fi

# Set NNTP Server for epita newsgroups (slrn)
export NNTPSERVER=news.epita.fr

# History file path
export HISTFILE=~/.histfile

# Zsh session history size
export HISTSIZE=10000

# History file size
export SAVEHIST=10000

# Color for less
export LESS_TERMCAP_mb="\e[1;31m"
export LESS_TERMCAP_md="\e[1;31m"
export LESS_TERMCAP_me="\e[0m"
export LESS_TERMCAP_se="\e[0m"
export LESS_TERMCAP_so="\e[1;44;33m"
export LESS_TERMCAP_ue="\e[0m"
export LESS_TERMCAP_us="\e[1;32m"

# Source ssh-agent
[ -e ~/.ssh/ssh_${HOST}_${USER}.agent ] && . ~/.ssh/ssh_${HOST}_${USER}.agent
