#!/bin/bash

# MAKE OWN SCRIPT -- this is used for creating the git repo in the first place

#echo ""
#echo "=== COPYING DOTFILES ==="
#echo ""

#cd ~
#cp ~/.Xresources ~/dotfiles/
#cp ~/.bash_profile ~/dotfiles
#cp ~/.aliasrc ~/dotfiles
#cp ~/.bashrc ~/dotfiles
#cp -r ~/.config/ ~/dotfiles
#cp ~/.fehbg ~/dotfiles
#cp ~/.vimrc ~/dotfiles
#cp ~/.xinitrc ~/dotfiles
#cp ~/.gitconfig ~/dotfiles
#cp ~/bg1.png ~/dotfiles
#git commands to make local directory a hosted one

## MANUAL PACMAN INSTALLS -- GET SCRIPT FOR
## readme.md

echo ""
echo "=== CLEANING DOTFILES ==="
echo ""

rm ~/.Xresources
rm ~/.bash_profile
rm ~/.aliasrc
rm ~/.bashrc
#rm -rf ~/.config/
rm ~/.fehbg
rm ~/.vimrc
rm ~/.xinitrc
rm ~/.gitconfig
rm ~/bg1.png

echo ""
echo "=== SYMLINKING DOTFILES ==="
echo ""
ln -sv ~/dotfiles/.Xresources ~
ln -sv ~/dotfiles/.bash_profile ~
ln -sv ~/dotfiles/.aliasrc ~
ln -sv ~/dotfiles/.bashrc ~
#ln -sv ~/.dotfiles/.config/ ~ #doesn't work
cp -rv ~/dotfiles/.config ~
ln -sv ~/dotfiles/.fehbg ~
ln -sv ~/dotfiles/.vimrc ~
ln -sv ~/dotfiles/.xinitrc ~
ln -sv ~/dotfiles/.gitconfig ~
ln -sv ~/dotfiles/bg1.png ~
