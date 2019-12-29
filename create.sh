#!/bin/bash

echo ""
#echo "=== COPYING DOTFILES ==="
echo ""

#cd ~
#cp ~/.Xresources ~/.dotfiles/
#cp ~/.bash_profile ~/.dotfiles
#cp ~/.aliasrc ~/.dotfiles
#cp ~/.bashrc ~/.dotfiles
#cp -r ~/.config/ ~/.dotfiles
#cp ~/.fehbg ~/.dotfiles
#cp ~/.vimrc ~/.dotfiles
#cp ~/.xinitrc ~/.dotfiles
#cp ~/.gitconfig ~/.dotfiles



echo ""
echo "=== CLEANING DOTFILES ==="
echo ""

rm ~/.Xresources
rm ~/.bash_profile
rm ~/.aliasrc
rm ~/.bashrc
rm -rf ~/.config/
rm ~/.fehbg
rm ~/.vimrc
rm ~/.xinitrc
rm ~/.gitconfig

echo ""
echo "=== SYMLINKING DOTFILES ==="
echo ""
ln -sv ~/.dotfiles/.Xresources ~
ln -sv ~/.dotfiles/.bash_profile ~
ln -sv ~/.dotfiles/.aliasrc ~
ln -sv ~/.dotfiles/.bashrc ~
ln -sv ~/.dotfiles/.config/ ~
ln -sv ~/.dotfiles/.fehbg ~
ln -sv ~/.dotfiles/.vimrc ~
ln -sv ~/.dotfiles/.xinitrc ~
ln -sv ~/.dotfiles/.gitconfig ~
