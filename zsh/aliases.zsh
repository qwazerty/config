#!/bin/sh

# Common aliases
case $(uname -s) in
    Linux)
        alias ls='ls --color'
        alias l='ls --color'
        alias la='ls -la --color'
        alias ll='ls -l --color'
        ;;
    FreeBSD)
        alias ls='ls -G'
        alias l='ls -G'
        alias la='ls -la -G'
        alias ll='ls -l -G'
        ;;
esac

alias cdo='cd $_'
alias cdb='cd -'

alias e='vim'
alias u='ls'
alias o='cd'
alias j='jobs'
alias mk='mkdir -p'
alias tree='tree -AC'

alias psgrep='ps aux | grep -v grep | grep'
pskill() { kill -9 `ps aux | grep -v grep | grep $1 | awk '{ print $2 }'` }
alias wm_name='xprop | grep WM_CLASS'
alias chmox='chmod +x'
alias tmux='tmux -2'

alias g='git'
alias z='i3lock -c 424242'

alias am='alsamixer'
alias mmount='sudo mount -t ntfs -o uid=qwazerty,gid=users,umask=0022'
alias red='redshift -l 48.8566:2.3522'
alias ..='source ~/.zshrc'

# Setxkbmap aliases
alias us='setxkbmap us'
alias us_intl='setxkbmap us_intl'
alias fr='setxkbmap fr'
alias dv='setxkbmap us dvorak'

# Makefile aliases
alias m='make'
alias nake='make'
alias cm='./configure && make'
alias bcm='make distclean; ./bootstrap && ./configure && make'
alias bcdm='make distclean; ./bootstrap && ./configure -with-debug && make'
alias mclm='make clean && make'

# Haha.
alias emacs='emacs -nw'
alias ne='emacs'

# Programming aliases
alias valgrind='valgrind -v --leak-check=full --show-reachable=yes \
    --track-fds=yes --track-origins=yes'
# Dat flags
alias gppf='g++ -W -Wall -Wextra -Werror -std=c++0x -pedantic'
alias gccf='gcc -std=c99 -pedantic -Wall \
    -Wno-missing-braces -Wextra -Wno-missing-field-initializers -Wformat=2 \
    -Wswitch-default -Wswitch-enum -Wcast-align -Wpointer-arith \
    -Wbad-function-cast -Wstrict-overflow=5 -Wstrict-prototypes -Winline \
    -Wundef -Wnested-externs -Wcast-qual -Wshadow -Wunreachable-code \
    -Wlogical-op -Wfloat-equal -Wstrict-aliasing=2 -Wredundant-decls \
    -Wold-style-definition -Werror \
    -ggdb3 -g \
    -O0 \
    -fno-omit-frame-pointer -ffloat-store -fno-common -fstrict-aliasing'
alias retag='ctags --tag-relative -Rf.git/tags'

# Start ssh-agent
alias ssha='ssh-agent | grep -v echo > /tmp/ssh_${USER}.agent && source /tmp/ssh_${USER}.agent && ssh-add'
alias sshk='ssh-agent -k; rm /tmp/ssh_${USER}.agent'

# UNsafe SSH
alias unssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Ping test
alias pt='ping -c 3 www.google.com'
alias ptt='ping -c 3 www.acu.epita.fr'

# Docker aliases
ds() { [ -n "$1" ] && docker commit `docker ps -a -l -q` $1 }
dr() { [ -n "$1" ] && docker run -n=true -i -t $1 ${2:-zsh} }
drs() { dr $1 $2; echo -n "Commit container $1? "; read; ds $1 }
