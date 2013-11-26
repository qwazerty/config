#!/bin/sh

PWD=`pwd`

mkdir -p ~/.config
rm -rf ~/.zsh
rm -rf ~/.config/i3status
rm -rf ~/.i3
rm -rf ~/.vim
rm -rf ~/.project_gen
rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.vimpagerrc
rm -f ~/.Xresources
rm -f ~/.xinitrc
rm -f ~/.zcompdump
rm -f ~/.gitconfig

ln -s $PWD/zsh ~/.zsh
ln -s $PWD/config/i3status ~/.config/i3status
ln -s $PWD/i3 ~/.i3
ln -s $PWD/vim ~/.vim
ln -s $PWD/project_gen ~/.project_gen
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/vimpagerrc ~/.vimpagerrc
ln -s $PWD/Xresources ~/.Xresources
ln -s $PWD/xinitrc ~/.xinitrc
ln -s $PWD/gitconfig ~/.gitconfig
