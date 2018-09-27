## BEGIN ZSH CONFIGURATION ##

# Detect OS
OS=`uname`
IS_MAC=false
if [[ "$OS" == "Darwin" ]]; then
    IS_MAC=true
fi

# Path to your oh-my-zsh installation.
if [[ "$IS_MAC" == true ]]; then
    export ZSH=/Users/bsturgeon/.oh-my-zsh
else
    export ZSH=/home/brandon/.oh-my-zsh
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="philips"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    gitfast
    git-extras
    rvm
    ruby
    rails
    bundler
    gem
    command-not-found
    npm
    node
    pip
    python
    zsh-256color
    zsh-syntax-highlighting
)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Default editor
export EDITOR='vim'

# Set history size for reverse search
HISTSIZE=5000 # session history size
SAVEHIST=1000 # saved history


# Start oh-my-zsh
source $ZSH/oh-my-zsh.sh

## END ZSH CONFIGURATION ##

## BEGIN CUSTOM CONFIGURATION ##


# Ensure that yarn uses strict ssl
yarn config set strict-ssl true > /dev/null 2>&1

# Where I keep my scripts
SCRIPTS_DIR=~/_scripts
# List of scripts
SCRIPTS=(z)

# Preferred temp directory
export TEMP=~/.tmp/
if [ ! -d ~/.tmp ]; then
    mkdir ~/.tmp
fi
if [ ! -d ~/.tmp/.vim/ ]; then
    mkdir ~/.tmp/.vim
fi

zstyle ':filter-select:highlight' matched fg=green
zstyle ':filter-select' max-lines -1
zstyle ':filter-select' case-insensitive yes # enable case-insensitive
zstyle ':filter-select' extended-search yes # see below

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Custom functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Start Z
if [ -f $SCRIPTS_DIR/z/z.sh ]; then
    . $SCRIPTS_DIR/z/z.sh
fi

# Initialize V
if [ ! -f usr/local/bin/vv ]; then
    echo "[.zshrc] V isn't installed. Installing.."
    update_v
fi

# Automatically 'ls -F' after every CD
[ -z "$PS1" ] && return
function cd {
    builtin cd "$@" && ls -F
}

export PATH=/opt/local/bin:$PATH

## END CUSTOM CONFIGURATION


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
