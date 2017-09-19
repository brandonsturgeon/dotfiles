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
# Set the cafile for yarnpkg
# yarn config set cafile "$SSL_CERT_FILE" > /dev/null 2>&1

# Where I keep my scripts
SCRIPTS_DIR=~/_scripts
# List of scripts
SCRIPTS=(v z zaw)

# Preferred temp directory
export TEMP=~/.tmp/
if [ ! -d ~/.tmp ]; then
    mkdir ~/.tmp
fi
if [ ! -d ~/.tmp/.vim/ ]; then
    mkdir ~/.tmp/.vim
fi

# Source zaw / zaw configuration
source $SCRIPTS_DIR/zaw/zaw.zsh
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


alias zshrc="vim ~/.zshrc"

# Load Virtualenvwrapper commands
# . /usr/local/bin/virtualenvwrapper.sh

# Set the root certificagte
if [ -f ~/.set_root_cert.sh ]; then
    . ~/.set_root_cert.sh
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Start Z
if [ -f $SCRIPTS_DIR/z/z.sh ]; then
    . $SCRIPTS_DIR/z/z.sh
fi

# Automatically 'ls -F' after every CD
[ -z "$PS1" ] && return
function cd {
    builtin cd "$@" && ls -F
}

## END CUSTOM CONFIGURATION



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

# Project QS tmuxinator config
function _qs {
    tmuxinator start qs
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

function do_request {
  curl -X POST -F "origin_address=$ORIGIN_ADD" -F "destination_address=$DEST_ADD" localhost:3000/api/v1/directions/ | jq
}

# Update all scripts in script directory
function update_scripts {
    for script in $SCRIPTS; do
        git -C $SCRIPTS_DIR/$script pull origin master;
    done
}

function jpg_convert {
    convert $1 -sampling-factor 4:2:0 -strip -interlace JPEG $(python -c "print '$1'.split('.')[0]+'2.jpg'");
}

# convert $1 -sampling-factor 4:2:0 -strip -interlace JPEG discord2.jpg
## END CUSTOM FUNCTIONS ##
