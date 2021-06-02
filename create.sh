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
rm -rf ~/.config/
rm ~/.fehbg
rm ~/.vimrc
rm ~/.xinitrc
rm ~/.gitconfig
rm ~/bg1.png

echo ""
echo "=== SYMLINKING DOTFILES ==="
echo ""
cwd=$(pwd) 
ln -sv $cwd/.Xresources ~
ln -sv $cwd/.bash_profile ~
ln -sv $cwd/.aliasrc ~
ln -sv $cwd/.bashrc ~
#ln -sv ~/.dotfiles/.config/ ~ #doesn't work
cp -rv $cwd/.config ~/.config ~
ln -sv $cwd/.fehbg ~
ln -sv $cwd/.vimrc ~
ln -sv $cwd/.xinitrc ~
ln -sv $cwd/.gitconfig ~
cp ./bg1.png ~/bg1.png
#ln -sv ./dotfiles/bg1.png ~
wal -i ~/bg1.png
startx
