# Path to your zsh folder 
export ZSH="$HOME/.config/zsh"

# Theme & Plugins
ZSH_THEME="robbyrussell"
plugins=(vi-mode zsh-syntax-highlighting colored-man-pages)

# Runtime script
source $ZSH/zsh_it.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# For a full list of active aliases, run `alias`.
alias ls='ls --color=auto'
alias vim='nvim'
alias c='xsel --clipboard --input'
alias p='xsel --clipboard --output'
alias rr='ranger'
alias open='xdg-open'

bindkey -v
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi

export GPG_TTY=$(tty)
export LIBGL_ALWAYS_SOFTWARE=1 alacritty
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export VISUAL=nvim
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export HISTFILE="$HOME/.cache/.zsh_history"
export LESSHISTFILE="$HOME/.cache/.less_history"
export FILE="ranger"

setxkbmap -option caps:escape
