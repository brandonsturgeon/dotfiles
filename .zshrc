## BEGIN ZSH CONFIGURATION ##

# Path to your oh-my-zsh installation.
export ZSH=/home/brandon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="philips"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast git-extras rvm ruby rails bundler gem command-not-found npm node pip python zsh-256color zsh-syntax-highlighting)


# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Default editor
export EDITOR='vim'

# Set history size for reverse search
HISTSIZE=5000 # session history size
SAVEHIST=1000 # saved history

# Source zaw / zaw configuration
source ~/_scripts/zaw/zaw.zsh
bindkey '^n' zaw-history
bindkey -M filterselect '^r' down-line-or-history
bindkey -M filterselect '^s' up-line-or-history
bindkey -M filterselect '^e' accept-search

zstyle ':filter-select:highlight' matched fg=green
zstyle ':filter-select' max-lines -1
zstyle ':filter-select' case-insensitive yes # enable case-insensitive
zstyle ':filter-select' extended-search yes # see below

# Fix for zaw
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
alias zshrc="vim ~/.zshrc"


source $ZSH/oh-my-zsh.sh

## END ZSH CONFIGURATION ##


## BEGIN CUSTOM FUNCTIONS ##

# Easy Ubuntu Launcher position controls
function setlauncherleft {
    gsettings set com.canonical.Unity.Launcher launcher-position Left
}
function setlauncherbot {
    gsettings set com.canonical.Unity.Launcher launcher-position Bottom
}

# Easily record with asciinema
function rec {
    asciinema rec;
}

# Tree
function tree {
    ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}

# In-terminal weather
function weather {
    curl -4 wttr.in/${1:-68502}
}
# In-terminal moon
function moon {
    curl -4 wttr.in/moon
}

# Is it up?
function check {
    curl -Is https://$1 -L | grep HTTP/
}

function rainbow {
    yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done
}

function rainboww {
    local BIGLINE="░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m${BIGLINE}\n"; sleep .02; done
}

# Stat tmuxinator config
function _stat {
    tmuxinator start stat
}

function toucan {
    echo "░░░░░░░░▄▄▄▀▀▀▄▄███▄░░░░░░░░░░░░░░░░░"
    echo "░░░░░▄▀▀░░░░░░░▐░▀██▌░░░░░░░░░░░░░░░░"
    echo "░░░▄▀░░░░▄▄███░▌▀▀░▀█░░░░░░░░░░░░░░░░"
    echo "░░▄█░░▄▀▀▒▒▒▒▒▄▐░░░░█▌░░░░░░░░░░░░░░░"
    echo "░▐█▀▄▀▄▄▄▄▀▀▀▀▌░░░░░▐█▄░░░░░░░░░░░░░░"
    echo "░▌▄▄▀▀░░░░░░░░▌░░░░▄███████▄░░░░░░░░░"
    echo "░░░░░░░░░░░░░▐░░░░▐███████████▄░░░░░░"
    echo "░░░░░le░░░░░░░▐░░░░▐█████████████▄░░░"
    echo "░░░░toucan░░░░░░▀▄░░░▐██████████████▄"
    echo "░░░░░░has░░░░░░░░▀▄▄████████████████▄"
    echo "░░░░░arrived░░░░░░░░░░░░█▀██████░░░░░"
}
# Project QS tmuxinator config
function _qs {
    tmuxinator start qs
}

# Load Virtualenvwrapper commands
. /usr/local/bin/virtualenvwrapper.sh

# Automatically 'ls -F' after every CD
[ -z "$PS1" ] && return
function cd {
    builtin cd "$@" && ls -F
}

# Start Z
. ~/_scripts/z/z.sh

function do_request {
  curl -X POST -F "origin_address=$ORIGIN_ADD" -F "destination_address=$DEST_ADD" localhost:3000/api/v1/directions/ | jq
}

function update_scripts {
    git -C ~/_scripts/v pull origin master
    git -C ~/_scripts/z pull origin master
    git -C ~/_scripts/zaw pull origin master
}

## END CUSTOM FUNCTIONS ##

# Set the root certificagte
. ~/.set_root_cert.sh

