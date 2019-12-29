#!/bin/bash

# Initialize packages var
packages=''
pypack=''

# X.Org  | #xorg-apps was removed and 
packages+=' xorg-server xorg-xinit xf86-video-vmware'

# Terminal & WM | Urxvt, i3-wm, 
packages+=' rxvt-unicode i3-wm i3status' 

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
sudo pacman -Syu --noconfirm $packages
#sudo pacman -Q $packages

#Install PyWal
yes | sudo pip3 install $pypack 
