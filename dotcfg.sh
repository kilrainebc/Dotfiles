#!/bin/bash
#
# dotcfg
#
# Author: kilrainebc
# Description: small util for setting up dotfiles

function main () {
  distro=$( (lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1)
  if [[ $distro == 'NAME="Arch Linux"' ]]; then
    $distro='arch'
  # elif [[ $distro == <debians output> ]]; then
  else
    while [[ ! -f ./lib/"$distro".bash ]]; do
      read -p "Please supply a distro" "$distro"
    done
  fi
  source ./lib/$distro.bash
  install
}

main
