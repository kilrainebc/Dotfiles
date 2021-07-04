#!/bin/bash
#
# dotcfg
#
# Author: kilrainebc
# Description: small util for setting up dotfiles

# TODO: make a way to auto-detect distro.  

if [[ -z $1 ]]; then
  printf "usage: %s <DISTRO>\n " $(basename $0)
  exit 64
fi

if [[ ! -d ./"$1" ]]; then
  printf "distro provided (%s) does not have a configuration directory.\n" "$1"
  exit 64
fi

source ./"$1"/install.bash
main
