#!/bin/bash

# Initialize packages var
packages=''
pypack=''

# X.Org  |  
packages+=' xorg-apps xorg-server xorg-xinit xf86-video-vesa'

# Terminal & WM | Urxvt, i3-wm, 
packages+=' rxvt-unicode i3-wm' 

# Fonts | Dejavu & Overpass
packages+=' otf-overpass ttf-dejavu'

# UI | dmenu, ranger, feh, w3m, imagemagick, pywal
packages+=' dmenu ranger feh w3m imagemagick' 
pypack+=' pywal'

# Coding | Vim, python, pip
packages+=' vim python python-pip'

# Admin-Tools | SSH, Firefox 
packages+=' openssh firefox'  

#test output of packages
printf "$packages\n"
printf "$pypack\n"

#Install Packages
#sudo pacman -Syu --noconfirm $packages

#Install PyWal
#yes | pip3 install $pypack 
