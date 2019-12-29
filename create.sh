#!/bin/bash

echo ""
echo "=== Copying files ==="
echo ""

cd ~
cp ~/.Xresources ~/.dotfiles/
cp ~/.bash_profile ~/.dotfiles
cp ~/.aliasrc ~/.dotfiles
cp ~/.bashrc ~/.dotfiles
cp -r ~/.config/ ~/.dotfiles
cp ~/.fehbg ~/.dotfiles
cp ~/.vimrc ~/.dotfiles
cp ~/.xinitrc ~/.dotfiles
cp ~/.gitconfig ~/.dotfiles



echo ""
echo "=== CLEANING ==="
echo ""

#rm $(HOME)/.Xresources
#rm $(HOME)/.bash_profile
#rm $(HOME)/.aliasrc
#rm $(HOME)/.bashrc
#rm -rf $(HOME)/.config/
#rm $(HOME)/.fehbg
#rm $(HOME)/.vimrc
#rm $(HOME)/.xinitrc
#rm $(HOME)/.gitconfig

echo ""
echo "=== SYMLINKING ==="
echo ""
#ln -sv ~/.dotfiles/.Xresources ~
#ln -sv ~/.dotfiles/.bash_profile ~
#ln -sv ~/.dotfiles/.aliasrc ~
#ln -sv ~/.dotfiles/.bashrc ~
#ln -sv ~/.dotfiles/.config/ ~
#ln -sv ~/.dotfiles/.fehbg ~
#ln -sv ~/.dotfiles/.vimrc ~
#ln -sv ~/.dotfiles/.xinitrc ~
#ln -sv ~/.dotfiles/.gitconfig ~
