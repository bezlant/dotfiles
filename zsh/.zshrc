# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode zsh-syntax-highlighting colored-man-pages zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias vim='nvim'
alias vi='nvim'
alias c='xsel --clipboard --input'
alias p='xsel --clipboard --output'
alias ll="exa -l -g --icons"
alias la="ll -a"
alias ls="exa --icons -F --sort=name --oneline"
alias tree="ls -T"
alias l="la"
alias clang-dump="clang-format -style=llvm -dump-config > .clang-format"
alias vg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind_result.txt'
alias nrc='nvim -c "cd ~/.config/nvim/lua/config" ~/.config/nvim/lua/config/plugins.lua'
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
alias gcnv='git commit --no-verify'
alias gpnv='git push --no-verify'
alias wimg="wezterm imgcat"

# Exports
export GPG_TTY=$(tty)
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
    export GOPATH="/home/tarticar/.go"
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

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
