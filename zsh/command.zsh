# The following lines were added by compinstall
zstyle :compinstall filename '/home/qwazerty/.zshrc'

autoload -U compinit promptinit
compinit
promptinit
# End of lines added by compinstall

# Disable beep sound
unsetopt beep

# Disable matching
unsetopt nomatch

# Disable extented globing
unsetopt extendedglob

# Ignore duplicate in history
setopt histignoredups
