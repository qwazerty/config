#!/bin/sh

PACKAGES="base base-devel xorg xorg-xinit i3 dmenu ttf-inconsolata rxvt-unicode openssh openldap dnsutils dhclient zsh git vim"

pacman -Syu $PACKAGES
