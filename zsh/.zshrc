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
alias ll="exa -l -g --icons"
alias la="ll -a"
alias ls="exa --icons -F --sort=name --oneline"
alias tree="ls -T"
alias l="la"
alias clang-dump="clang-format -style=llvm -dump-config > .clang-format"
alias vg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind_result.txt'
alias nrc='nvim -c "cd" ~/.config/nvim/lua/config'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gco='git checkout'
alias gcl='git clone'
alias lg='lazygit'
function fn_zathura {
    zathura $1 & disown
}
alias zth='fn_zathura'
alias rm='trash'
alias rmr='trash-restore'
alias rml='trash-list'
alias wiki='wikit'
alias zshrc='vim ~/.zshrc'
alias bmake='bear -- make'

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

if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi

setxkbmap -option caps:escape
