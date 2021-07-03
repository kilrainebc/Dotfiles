#!/bin/bash

printf "\n[+] Cleaning Dotfiles\n"
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

printf "\n[+] Symlinking Dotfiles\n"
ln -sv $(pwd)/.Xresources ~
ln -sv $(pwd)/.bash_profile ~
ln -sv $(pwd)/.aliasrc ~
ln -sv $(pwd)/.bashrc ~
cp -rv $(pwd)/.config ~/.config ~
ln -sv $(pwd)/.fehbg ~
ln -sv $(pwd)/.vimrc ~
ln -sv $(pwd)/.xinitrc ~
ln -sv $(pwd)/.gitconfig ~
cp ./bg1.png ~/bg1.png
wal -i ~/bg1.png
startx
