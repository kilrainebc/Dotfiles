function install () {
  install_software
  install_configs
  load_gui  
}

function install_software () {  
  install_via_apt
  install_manually
  install_via_pip
  install_via_goget
}

function install_via_apt () {
  local packages
  
  sudo apt update

  # Shell
  packages+=' zsh'

  # X.Org  | xorg 
  packages+=' xorg'

  # Terminal & WM | Urxvt, i3-wm, 
  packages+=' rxvt-unicode i3-wm i3status' 

  # Fonts | Dejavu & Overpass
  packages+=' ttf-dejavu'

  # UI | dmenu, ranger, feh, w3m, imagemagick, pywal
  packages+=' dmenu ranger feh w3m imagemagick neofetch' 
  
  # Coding | Vim, python, pip
  packages+=' vim python python-pip'

  # Admin-Tools | SSH, Firefox 
  packages+=' firefox-esr wget'  

  #Install Packages
  sudo apt install -y $packages
}

function install_manually () {
  install_shellcheck
  install_go
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

function install_go () {
    if [[ ! $(go version) ]]; then
      local goversion
      goversion="go1.16.5.linux-amd64.tar.gz"
      wget https://golang.org/dl/${goversion}
      sudo tar -C /usr/local -xzf ${goversion}
      sudo ln -sv /usr/local/go/bin/go /usr/bin/go 
      rm -rf "${goversion}"
    fi
}

function install_via_pip () {
  local packages

  # PyWal
  packages+=' pywal'

  # Install Packages
  yes | sudo pip3 install $packages
}

function install_via_goget () {
  local packages

  # shfmt
  packages+=' mvdan.cc/sh/v3/cmd/shfmt' 
  
  for package in $packages; do
    go get $package
  done
  
  if [[ -z $GOPATH ]]; then
    GOPATH=$(go env GOPATH) 
  fi  
  sudo mv "$GOPATH"/bin/* /usr/bin
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
  # refresh ./configs 
  dir="$(pwd)/configs"
  ln -sv $dir/.Xresources ~
  ln -sv $dir/.bash_profile ~
  ln -sv $dir/.aliasrc ~
  ln -sv $dir/.bashrc ~
  #ln -sv $dir/.config ~ # TODO - figure out how to get this to work
  cp -r $dir/.config ~/.config/ 
  ln -sv $dir/.fehbg ~
  ln -sv $dir/.vimrc ~
  ln -sv $dir/.xinitrc ~
  ln -sv $dir/.gitconfig ~
  ln -sv $dir/bg1.png ~
}

function load_gui () {
  resize_resolution 
  wal -i ~/bg1.png
  startx    
}

function reload () {
  install_configs
  wal -i ~/bg1.png
}

function resize_resolution () {
  local resolution

  resolution=$(xrandr | grep "*" | awk '{print $1}')
  printf "dotcfg: Current resolution: %s\n" $resolution

  case "$1" in
    laptop)
      case "$2" in
        fullscreen)
          resolution="1360x768"	
	;;
	windowed)
          resolution="800x600"	
	;;
	*)
	read -p "dotcfg: please specify a resolution: " resolution
	;;
      esac 
    ;; 
    desktop)
      case "$2" in
        fullscreen)
	  resolution="1920x1080"
	;;
	windowed)
	  resolution="1440x900"
	;; 
	*)
	  read -p "dotcfg: please specify a resolution: " resolution
	;;
      esac
    ;; 
    *) 
      read -p "dotcfg: please specify a resolution: " resolution
    ;;
  esac
  
  xrandr -s $resolution 
  
  resolution=$(xrandr | grep "*" | awk '{print $1}')
  printf "dotcfg: New resolution: %s\n" $resolution
}
