#! /bin/sh
echo "Use this if you want to install conf for all users (run as root)"
read -p "Are you sure? (y/n) " REPLY
case $REPLY in
    y|Y ) ;;
    * ) exit 1;;
esac
if [ `whoami` != "root" ]; then
    echo "You are not root!"
fi

var=`pwd`
mkdir -p ~/.config
mkdir -p /etc/zsh
rm -rf /etc/zsh/plugins
rm -rf ~/.zsh
rm -rf ~/.i3
rm -rf ~/.vim
rm -rf ~/.project_gen
ln -fs $var/dotmybashrc ~/.mybashrc
ln -fs $var/dotzshrc ~/.zshrc
ln -fs $var/dotvimrc ~/.vimrc
ln -fs $var/dotvimpagerrc ~/.vimpagerrc
ln -fs $var/dotconfig/i3status ~/.config/i3status
ln -fs $var/dotzsh /etc/zsh/plugins
ln -fs $var/doti3 ~/.i3
ln -fs $var/dotvim ~/.vim
ln -fs $var/dotproject_gen ~/.project_gen
ln -fs $var/dotXresources ~/.Xresources
ln -fs $var/dotxinitrc ~/.xinitrc
