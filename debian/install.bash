#!/bin/bash

function install-packages () {

  local packages
  local pypack

  #sudo rm /etc/pacman.d/gnupg -r
  #sudo pacman-key --init
  #sudo pacman-key --populate archlinux

  # Shell
  packages+=' zsh'

  # X.Org  | #xorg-apps was removed and 
  #packages+=' xorg-server xorg-xinit xf86-video-vmware'
  packages+=' xorg' 
  #packages+=' xserver-xorg-video-vmware' 
   
  # Terminal & WM | Urxvt, i3-wm, 
  packages+=' rxvt-unicode i3-wm i3status' 

  # Fonts | Dejavu & Overpass
  #packages+=' otf-overpass ttf-dejavu'
  packages+=' ttf-dejavu'

  # to install overpass, need to:
  ### get *.ttf or *.otf files
  ### place files in /usr/local/share/fonts
  ### make sure perms are 644
  ### run fc-cache to update font cache
  ### verify they exist with fc-list
  ### edit fontconfig file

  # UI | dmenu, ranger, feh, w3m, imagemagick, pywal
  packages+=' dmenu ranger feh w3m imagemagick neofetch' 
  pypack+=' pywal'

  # Coding | Vim, python, pip
  packages+=' vim python python3-pip'

  # Admin-Tools | SSH, Firefox 
  packages+=' firefox-esr wget'  

  #Install Packages
  sudo apt-get install -y $packages  
 
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
function install-go () {
    if [[ ! $(go version) ]]; then
      local goversion
      goversion="go1.16.5.linux-amd64.tar.gz"
      wget https://golang.org/dl/${goversion}
      sudo tar -C /usr/local -xzf ${goversion} 
      {
        printf "export GOPATH=/usr/local/go\n" 
        printf "export PATH=%s:/usr/local/go/bin\n" "$PATH" 
      } | sudo tee -a /etc/profile
      source /etc/profile 
      rm -rf "${goversion}"
    fi
}

function install-shfmt () {
  if [[ ! $(shfmt --version) ]]; then  
    if [[ -z $GOPATH ]];then
      sudo source /etc/profile 
    fi
    sudo -E /usr/local/go/bin/go get mvdan.cc/sh/v3/cmd/shfmt  
  fi 
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
  dir="$(pwd)/debian"
  ln -sv $dir/.Xresources ~
  ln -sv $dir/.bash_profile ~
  ln -sv $dir/.aliasrc ~
  ln -sv $dir/.bashrc ~
  cp -rv $dir/.config ~/.config
  ln -sv $dir/.fehbg ~
  ln -sv $dir/.vimrc ~
  ln -sv $dir/.xinitrc ~
  ln -sv $dir/.gitconfig ~
  cp $dir/bg1.png ~/bg1.png
}

function start-gui () {
  sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt
  sudo wal -i ~/bg1.png
  startx
}

function main () {
    install-packages
    install-shellcheck
    install-go 
    install-shfmt
    clean-dotfiles
    create-symlinks
    start-gui
}
