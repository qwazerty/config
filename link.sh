#! /bin/sh

var=`pwd`
rm -rf ~/.mybashrc ~/.vimrc ~/.tmux.conf
ln -s $var/.mybashrc ~/.mybashrc
ln -s $var/.vimrc ~/.vimrc
ln -s $var/.tmux.conf ~/.tmux.conf
