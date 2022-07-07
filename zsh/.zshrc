#!/usr/bin/env zsh

ZSH=$HOME/.config/zsh
source $ZSH/.env
source $ZSH/.aliases

source $ZSH/plugins/git.zsh
source $ZSH/plugins/theme-and-appearance.zsh
source $ZSH/themes/robbyrussell.zsh-theme

HISTFILE=~/.cache/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

bindkey -v
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi
