#################################
# dotzshrc config file          #
# by Kevin "qwazerty" Houdebert #
#################################

# Load all files in ~/.zsh/
for file in ~/.zsh/*.zsh; do
    source $file
done

# Load custom conf file
[ -e ~/.myzshrc ] && . ~/.myzshrc
