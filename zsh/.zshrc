# Startup X 
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi

# Path to zsh folder 
export ZSH="$HOME/.config/zsh"

# Theme & Plugins
ZSH_THEME="robbyrussell"
plugins=(vi-mode zsh-syntax-highlighting colored-man-pages)

# Runtime script
source $ZSH/zsh_it.sh

# For a full list of active aliases, run `alias`.
alias vim='nvim'
alias vi='nvim'
alias c='xsel --clipboard --input'
alias p='xsel --clipboard --output'
alias rr='ranger'
alias open='xdg-open'
alias vg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind_result.txt'
alias ll="exa -l -g --icons"
alias la="ll -a"
alias ls="exa --icons -F --sort=size"
alias tree="ls -T"
alias l="la"

# Exports
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
