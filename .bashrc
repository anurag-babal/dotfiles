#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignoreboth:erasedups
export PATH=$PATH:$HOME/.local/bin
