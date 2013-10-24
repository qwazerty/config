#!/bin/sh

# Common aliases
alias us='setxkbmap us'
alias us_intl='setxkbmap us_intl'
alias fr='setxkbmap fr'
alias ls='ls --color'
alias l='ls --color'
alias la='ls -la --color'
alias ll='ls -l --color'
alias cdo='cd $_'
alias cdb='cd -'
alias e='vim'
alias c=' google-chrome || chromium-browser'
alias j='jobs'
alias psgrep='ps aux | grep -v grep | grep'

# ChmoXXX
alias chmox='chmod +x'

# Makefile aliases
alias m='make'
alias nake='make'
alias cm='./configure && make'
alias bcm='make distclean; ./bootstrap && ./configure && make'
alias bcdm='make distclean; ./bootstrap && ./configure -with-debug && make'
alias mclm='make clean && make'

# Haha like I would use emacs
alias emacs='emacs -nw'
alias ne='emacs'

# Git related aliases
alias gadd='git add -v'
alias gcommit='git commit -am '
alias gpull='git pull -v origin master'
alias gpush='gpull && git push -v origin master'
alias glist='git diff --cached --name-only'
alias gstat='git status'
alias gshow='git ls-tree --name-only -r HEAD'

# EPITA related aliases
alias z='i3lock -c 424242'
alias gen='~/.project_gen/gen.sh'

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
alias ssha='eval $(ssh-agent) && ssh-add'
alias pt='ping -c 3 www.google.com'
alias ptt='ping -c 3 www.acu.epita.fr'

# Custom aliases
alias am='alsamixer'
alias mmount='sudo mount -t ntfs -o uid=qwazerty,gid=users,umask=0022'
alias red='redshift -l 48.8566:2.3522'
alias ..='source ~/.zshrc'
