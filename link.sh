#! /bin/sh

var=`pwd`

mkdir -p ~/.config
rm -rf ~/.zsh
rm -rf ~/.zsh
rm -rf ~/.i3
rm -rf ~/.vim
rm -rf ~/.project_gen
ln -fs $var/dotzsh ~/.zsh
ln -fs $var/dotzshrc ~/.zshrc
ln -fs $var/dotvimrc ~/.vimrc
ln -fs $var/dotvimpagerrc ~/.vimpagerrc
ln -fs $var/dotconfig/i3status ~/.config/i3status
ln -fs $var/doti3 ~/.i3
ln -fs $var/dotvim ~/.vim
ln -fs $var/dotproject_gen ~/.project_gen
ln -fs $var/dotXresources ~/.Xresources
ln -fs $var/dotxinitrc ~/.xinitrc
