#! /bin/sh

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

cp -r dotzsh ~/.zsh
cp -r dotconfig/i3status ~/.config/i3status
cp -r doti3 ~/.i3
cp -r dotvim ~/.vim
cp -r dotproject_gen ~/.project_gen
cp -r dotzshrc ~/.zshrc
cp -r dotvimrc ~/.vimrc
cp -r dotvimpagerrc ~/.vimpagerrc
cp -r dotXresources ~/.Xresources
cp -r dotxinitrc ~/.xinitrc

if [ `whoami` = 'root' ]; then
    mkdir -p /etc/zsh/plugins/
    cp dotzsh/* /etc/zsh/plugins/ -r
fi

if [ -e /etc/zsh/plugins ]; then
    sed -i -e 's/^ZSH=.*$/ZSH=\/etc\/zsh\/plugins\/oh-my-zsh/' ~/.zshrc
else
    sed -i -e 's/^ZSH=.*$/ZSH=~\/.zsh\/oh-my-zsh/' ~/.zshrc
fi
