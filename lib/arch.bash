function install () {
  install_software
  install_configs
  load_gui  
}

function install_software () {  
  install_via_pacman
  install_via_pip
  install_via_goget
  install_manually
}

function install_via_pacman () {
  local packages

  sudo pacman-key --refresh-keys
  #sudo rm /etc/pacman.d/gnupg -r
  #sudo pacman-key --init
  #sudo pacman-key --populate archlinux

  # Shell
  packages+=' zsh'

  # X.Org  | #xorg-apps was removed and 
  packages+=' xorg-server xorg-xinit xf86-video-vmware'

  # Terminal & WM | Urxvt, i3-wm, 
  packages+=' rxvt-unicode i3-wm i3status' 

  # Fonts | Dejavu & Overpass
  packages+=' otf-overpass ttf-dejavu'

  # UI | dmenu, ranger, feh, w3m, imagemagick, pywal
  packages+=' dmenu ranger feh w3m imagemagick neofetch' 
  
  # Coding | Vim, python, pip
  packages+=' vim python python-pip go'

  # Admin-Tools | SSH, Firefox 
  packages+=' openssh firefox wget'  

  #Install Packages
  sudo pacman -Syu --noconfirm $packages
}

function install_via_pip () {
  local packages

  # PyWal
  pypack+=' pywal'

  # Install Packages
  yes | sudo pip3 install $packages
}

function install_via_goget () {
  local packages

  # shfmt
  packages+=' mvdan.cc/sh/v3/cmd/shfmt' 
  
  for each package in packages; do
    go get $package
  done

  sudo mv -f "$GOPATH"/bin/* /usr/bin
}

function install_manually () {
  install_shellcheck
}

function install_shellcheck () {
  if [[ ! $(shellcheck --version) ]]; then
    local scversion
    scversion="latest" # or "v0.4.7", or "stable", or "latest"
    wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
    sudo cp "shellcheck-${scversion}/shellcheck" /usr/bin/
    rm -rf "shellcheck-${scversion}"    
  fi
}

function install_configs () {
  remove_configs
  create_symlinks
}

function remove_configs () { 
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

function create_symlinks () {
  git pull
  dir="$(pwd)/cfgs"
  ln -sv $dir/.Xresources ~
  ln -sv $dir/.bash_profile ~
  ln -sv $dir/.aliasrc ~
  ln -sv $dir/.bashrc ~
  #cp -rv $dir/.config ~/.config
  ln -sv $dir/.config ~
  ln -sv $dir/.fehbg ~
  ln -sv $dir/.vimrc ~
  ln -sv $dir/.xinitrc ~
  ln -sv $dir/.gitconfig ~
  #cp $dir/bg1.png ~/bg1.png
  ln -sv $dir/.bg1.png ~
}

function load_gui () {
  wal -i ~/bg1.png
  startx    
}