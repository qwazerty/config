#! /bin/sh
echo "Use this if you want to install conf only for this user"
read -p "Are you sure? (y/n) " REPLY
case $REPLY in
    y|Y ) echo "Done";;
    * ) exit 1;;
esac

var=`pwd`
mkdir -p ~/.config
rm -rf ~/.zsh
rm -rf ~/.i3
rm -rf ~/.vim
rm -rf ~/.project_gen
ln -fs $var/dotmybashrc ~/.mybashrc
ln -fs $var/dotzshrc ~/.zshrc
ln -fs $var/dotvimrc ~/.vimrc
ln -fs $var/dotvimpagerrc ~/.vimpagerrc
ln -fs $var/dotconfig/i3status ~/.config/i3status
ln -fs $var/dotzsh ~/.zsh
ln -fs $var/doti3 ~/.i3
ln -fs $var/dotvim ~/.vim
ln -fs $var/dotproject_gen ~/.project_gen
ln -fs $var/dotXresources ~/.Xresources
ln -fs $var/dotxinitrc ~/.xinitrc
