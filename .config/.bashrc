#
# ~/.bashrc
#
# Author: kilrainebc
# Description: executed when bash started

# shellcheck disable=SC2148,SC1090

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

files="/etc/profile
  $HOME/.aliasrc"

for file in $files; do
  if [[ -f "$file" ]]; then
    source "$file"
  fi
done

neofetch

