#! /bin/sh

var=`pwd`
rm -rf ~/.mybashrc ~/.vimrc ~/.tmux.conf ~/.i3
ln -s $var/.mybashrc ~/.mybashrc
ln -s $var/.vimrc ~/.vimrc
ln -s $var/.tmux.conf ~/.tmux.conf
ln -s $var/.i3 ~/.i3
