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
alias ll="exa -l -g --icons"
alias la="ll -a"
alias ls="exa --icons -F --sort=name --oneline"
alias tree="ls -T"
alias l="la"
alias clang-dump="clang-format -style=llvm -dump-config > .clang-format"
alias vg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind_result.txt'
alias nrc='nvim -c "cd" ~/.config/nvim/lua/config'
alias gcl='git clone'
alias lg='lazygit'
function fn_zathura {
    zathura $1 & disown
}
alias zth='fn_zathura'
alias wiki='wikit'
alias zshrc='vim ~/.zshrc'
alias bmake='bear -- make'
alias tsm='transmission-remote'
alias db='dotnet build'
alias dr='dotnet run'
alias gcnv='git commit --no-verify'
alias gpnv='git push --no-verify'

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
export DOCKER_CONTENT_TRUST=1

if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi

if [[ "$OSTYPE" == "darwin20.0" ]]; then
    export GOPATH="/Users/tarticar/go"
    export PATH="/opt/goinfre/tarticar/homebrew/sbin:$PATH"
    export PATH="/opt/goinfre/tarticar/homebrew/bin:$PATH"
    export PATH="/opt/goinfre/tarticar/homebrew/opt/llvm/bin/:$PATH"
    export NPM_CONFIG_USERCONFIG="/opt/goinfre/tarticar/.npm/"
    export YARN_CACHE_FOLDER="/opt/goinfre/tarticar/.yarn/"
    export PATH="/usr/local/bin:$PATH"
    # export PATH="/Users/tarticar/Library/Python/3.9/bin:$PATH"
    export PATH="/Users/tarticar/.local/share/nvim/mason/bin:$PATH"
    export LDFLAGS="-L/opt/goinfre/tarticar/homebrew/opt/llvm/lib"
    export CPPFLAGS="-I/opt/goinfre/tarticar/homebrew/opt/llvm/include"
    export PATH="$PATH:/Users/tarticar/.dotnet/tools"
# Tmux
    if [[ -z "$TMUX" ]]; then
        if tmux has-session 2>/dev/null; then
            exec tmux attach
        else
            exec tmux
        fi
    fi
else
    export GOPATH="/home/tarticar/go"
    export PATH="$PATH:/home/tarticar/.dotnet/tools"
    export PATH="$PATH:/home/tarticar/.local/bin"
    alias open='xdg-open'
    # This is neccessary otherwise external keyboards don't get the layout change bindings on boot through .xinitrc
    setxkbmap -layout us,ru -option grp:alt_shift_toggle
    setxkbmap -option caps:escape
fi

export PATH="$GOPATH/bin:$PATH"
eval $(thefuck --alias)
export _JAVA_OPTIONS="-Dsun.java2d.dpiaware=true -Dsun.java2d.uiScale=2"
stty stop undef
stty start undef
