#
# ~/.bash_profile
#
# Author: kilrainebc
# Description: executed when bash invoked as interactive login shell

# shellcheck disable=SC2148,SC1090

if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

startx
