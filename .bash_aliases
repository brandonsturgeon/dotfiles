# LS and Grep aliases if color support is enabled
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='grep -F --color=auto'
    alias egrep='grep -E --color=auto'
fi

alias cls='clear'

# LS aliases
alias lf='ls -alF'
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# .rc aliases
alias vimrc='vim -O ~/.vimrc ~/.bundles.vim'
alias bashrc='vim ~/.bashrc'

# Navigate to the git root
alias gitroot='cd $(git rev-parse --show-cdup)'

# Git
alias g="git"

# Vim
alias v="vim"

# DF to always use -h flag
alias df="df -h"

# Edit .zshrc
alias zshrc="vim ~/.zshrc"
