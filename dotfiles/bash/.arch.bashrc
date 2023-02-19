#
# ~/.bashrc
#

# include .bashrc if it exists
if [ -f /home/max/source/personal/dotfiles/bash/.bashrc ]; then
    . /home/max/source/personal/dotfiles/bash/.bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

