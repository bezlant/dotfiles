# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi


export XDG_CONFIG_HOME=$HOME/.config
export LESSHISTFILE=-

alias ls='ls --color=auto'

alias copy='xsel --clipboard --input'
alias paste='xsel --clipboard --output'
# End of lines configured by zsh-newuser-install
