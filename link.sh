#! /bin/sh

var=`pwd`
rm -f ~/.mybashrc
rm -f ~/.vimrc
rm -rf ~/.i3
rm -rf ~/.config/i3status
ln -s $var/dotmybashrc ~/.mybashrc
ln -s $var/dotvimrc ~/.vimrc
ln -s $var/doti3 ~/.i3
ln -s $var/dotconfig/i3status ~/.config/i3status
