# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/brandon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="philips"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast git-extras rvm ruby rails bundler gem command-not-found npm node pip python zsh-256color zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='vim'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
alias zshrc="vim ~/.zshrc"

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

## END CUSTOM FUNCTIONS ##

# Set the root certificagte
. ~/.set_root_cert.sh
