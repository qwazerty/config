#! /bin/sh

var=`pwd`
rm -f ~/.mybashrc
rm -f ~/.vimrc
rm -f ~/.vimpagerrc
rm -rf ~/.i3
rm -rf ~/.vim
rm -rf ~/.config/i3status
rm -rf ~/.project_gen
ln -s $var/dotmybashrc ~/.mybashrc
ln -s $var/dotvimrc ~/.vimrc
ln -s $var/dotvimpagerrc ~/.vimpagerrc
ln -s $var/doti3 ~/.i3
ln -s $var/dotvim ~/.vim
ln -s $var/dotconfig/i3status ~/.config/i3status
ln -s $var/dotproject_gen ~/.project_gen
