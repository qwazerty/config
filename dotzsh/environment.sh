#!/bin/sh

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
