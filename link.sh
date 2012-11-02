#! /bin/sh

var=`pwd`
rm -rf ~/.mybashrc ~/.vimrc ~/.i3 ~/.login
ln -s $var/dotmybashrc ~/.mybashrc
ln -s $var/dotvimrc ~/.vimrc
ln -s $var/doti3 ~/.i3
