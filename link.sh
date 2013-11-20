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

ln -s $PWD/dotzsh ~/.zsh
ln -s $PWD/dotconfig/i3status ~/.config/i3status
ln -s $PWD/doti3 ~/.i3
ln -s $PWD/dotvim ~/.vim
ln -s $PWD/dotproject_gen ~/.project_gen
ln -s $PWD/dotzshrc ~/.zshrc
ln -s $PWD/dotvimrc ~/.vimrc
ln -s $PWD/dotvimpagerrc ~/.vimpagerrc
ln -s $PWD/dotXresources ~/.Xresources
ln -s $PWD/dotxinitrc ~/.xinitrc
ln -s $PWD/dotgitconfig ~/.gitconfig
