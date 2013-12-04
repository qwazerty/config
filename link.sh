#!/bin/sh

PWD=`pwd`

rm -rf ~/.zsh
rm -rf ~/.i3
rm -rf ~/.vim
rm -rf ~/.weechat
rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.vimpagerrc
rm -f ~/.Xresources
rm -f ~/.xinitrc
rm -f ~/.zcompdump
rm -f ~/.gitconfig
rm -f ~/.tmux.conf

ln -s $PWD/zsh ~/.zsh
ln -s $PWD/i3 ~/.i3
ln -s $PWD/vim ~/.vim
ln -s $PWD/weechat ~/.weechat
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/vimpagerrc ~/.vimpagerrc
ln -s $PWD/Xresources ~/.Xresources
ln -s $PWD/xinitrc ~/.xinitrc
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/tmux.conf ~/.tmux.conf
