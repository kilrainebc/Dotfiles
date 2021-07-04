#!/bin/bash

function install-packages () {

  local packages
  local pypack

  sudo rm /etc/pacman.d/gnupg -r
  sudo pacman-key --init
  sudo pacman-key --populate archlinux

  # X.Org  | #xorg-apps was removed and 
  packages+=' xorg-server xorg-xinit xf86-video-vmware'

  # Terminal & WM | Urxvt, i3-wm, 
  packages+=' rxvt-unicode i3-wm i3status' 

  # Fonts | Dejavu & Overpass
  packages+=' otf-overpass ttf-dejavu'

  # UI | dmenu, ranger, feh, w3m, imagemagick, pywal
  packages+=' dmenu ranger feh w3m imagemagick neofetch' 
  pypack+=' pywal'

  # Coding | Vim, python, pip
  packages+=' vim python python-pip'

  # Admin-Tools | SSH, Firefox 
  packages+=' openssh firefox wget'  

  #Install Packages
  sudo pacman -Syu --noconfirm $packages
  
  #Install PyWal
  yes | sudo pip3 install $pypack 

}

function install-shellcheck () {
  if [[ ! $(shellcheck --version) ]]; then
    local scversion
    scversion="latest" # or "v0.4.7", or "stable", or "latest"
    wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
    sudo cp "shellcheck-${scversion}/shellcheck" /usr/bin/
    rm -rf "shellcheck-${scversion}"    
  fi
}

function install-shfmt () {
  while [[ ! $(shfmt --version) ]]; do 
    while [[ ! $(go version) ]]; do
      wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz
      sudo tar -C /usr/local -xzf go1.16.5.linux-amd64.tar.gz
      if [[ -z $GOPATH ]]; then
        {
	  printf "export PATH=%s:/usr/local/go/bin\n" "$PATH"
	  printf "export GOPATH=/usr/local/go\n"
        } | sudo tee -a /etc/profile 
        source /etc/profile
      fi 
    done
    sudo go get mvdan.cc/sh/v3/cmd/shfmt  
  done 
}

function clean-dotfiles () {
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
}

function create-symlinks () {
  dir="$(pwd)/arch"
  ln -sv $dir/.Xresources ~
  ln -sv $dir/.bash_profile ~
  ln -sv $dir/.aliasrc ~
  ln -sv $dir/.bashrc ~
  cp -rv $dir/.config ~/.config
  ln -sv $dir/.fehbg ~
  ln -sv $dir/.vimrc ~
  ln -sv $dir/.xinitrc ~
  ln -sv $dir/.gitconfig ~
  cp ./bg1.png ~/bg1.png
}

function start-gui () {
  wal -i ~/bg1.png
  startx
}

function main () {
    install-packages
    install-shellcheck
    #install-shfmt #something wrong with this
    clean-dotfiles
    create-symlinks
    start-gui
}
