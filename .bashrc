#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
#PS1="\033[36m\]\u\[\033[m\]@\h[\033[33;1m\]\w\[\033[m\]]\n-> "  
###YASH SETUP###

source ~/.aliasrc


