# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# 256 color
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth


# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# default HISTSIZE:1000 HISTFILESIZE:2000
HISTSIZE=20000
HISTFILESIZE=40000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## Begin custom functions ##

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

## End custom functions ##

# Load Virtualenvwrapper commands
. /usr/local/bin/virtualenvwrapper.sh

# Automatically 'ls -F' after every CD
[ -z "$PS1" ] && return
function cd {
	builtin cd "$@" && ls -F
}

## Begin environment variables ##

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export EDITOR='vim' # Default editor to vim
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

## End environment variables ##

# Start Z
. ~/_scripts/z/z.sh
