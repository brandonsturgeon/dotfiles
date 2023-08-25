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
    curl -4 wttr.in/${1:-92122}
}

# Is it up?
function check {
    curl -Is https://$1 -L | grep HTTP/
}

function rainbow {
    local BIGLINE="░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m${BIGLINE}\n"; sleep 0; done
}

# Stat tmuxinator config
function _stat {
    tmuxinator start stat
}

function toucan {
    echo "░░░░░░░░▄▄▄▀▀▀▄▄███▄░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▀▀▀▄▄███▄░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▀▀▀▄▄███▄░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▀▀▀▄▄███▄░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▀▀▀▄▄███▄░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▀▀▀▄▄███▄░░░░░░░░░░░░░░░░░"
    echo "░░░░░▄▀▀░░░░░░░▐░▀██▌░░░░░░░░░░░░░░░░░░░░░▄▀▀░░░░░░░▐░▀██▌░░░░░░░░░░░░░░░░░░░░░▄▀▀░░░░░░░▐░▀██▌░░░░░░░░░░░░░░░░░░░░░▄▀▀░░░░░░░▐░▀██▌░░░░░░░░░░░░░░░░░░░░░▄▀▀░░░░░░░▐░▀██▌░░░░░░░░░░░░░░░░░░░░░▄▀▀░░░░░░░▐░▀██▌░░░░░░░░░░░░░░░░"
    echo "░░░▄▀░░░░▄▄███░▌▀▀░▀█░░░░░░░░░░░░░░░░░░░▄▀░░░░▄▄███░▌▀▀░▀█░░░░░░░░░░░░░░░░░░░▄▀░░░░▄▄███░▌▀▀░▀█░░░░░░░░░░░░░░░░░░░▄▀░░░░▄▄███░▌▀▀░▀█░░░░░░░░░░░░░░░░░░░▄▀░░░░▄▄███░▌▀▀░▀█░░░░░░░░░░░░░░░░░░░▄▀░░░░▄▄███░▌▀▀░▀█░░░░░░░░░░░░░░░░"
    echo "░░▄█░░▄▀▀▒▒▒▒▒▄▐░░░░█▌░░░░░░░░░░░░░░░░░▄█░░▄▀▀▒▒▒▒▒▄▐░░░░█▌░░░░░░░░░░░░░░░░░▄█░░▄▀▀▒▒▒▒▒▄▐░░░░█▌░░░░░░░░░░░░░░░░░▄█░░▄▀▀▒▒▒▒▒▄▐░░░░█▌░░░░░░░░░░░░░░░░░▄█░░▄▀▀▒▒▒▒▒▄▐░░░░█▌░░░░░░░░░░░░░░░░░▄█░░▄▀▀▒▒▒▒▒▄▐░░░░█▌░░░░░░░░░░░░░░░"
    echo "░▐█▀▄▀▄▄▄▄▀▀▀▀▌░░░░░▐█▄░░░░░░░░░░░░░░░▐█▀▄▀▄▄▄▄▀▀▀▀▌░░░░░▐█▄░░░░░░░░░░░░░░░▐█▀▄▀▄▄▄▄▀▀▀▀▌░░░░░▐█▄░░░░░░░░░░░░░░░▐█▀▄▀▄▄▄▄▀▀▀▀▌░░░░░▐█▄░░░░░░░░░░░░░░░▐█▀▄▀▄▄▄▄▀▀▀▀▌░░░░░▐█▄░░░░░░░░░░░░░░░▐█▀▄▀▄▄▄▄▀▀▀▀▌░░░░░▐█▄░░░░░░░░░░░░░░"
    echo "░▌▄▄▀▀░░░░░░░░▌░░░░▄███████▄░░░░░░░░░░▌▄▄▀▀░░░░░░░░▌░░░░▄███████▄░░░░░░░░░░▌▄▄▀▀░░░░░░░░▌░░░░▄███████▄░░░░░░░░░░▌▄▄▀▀░░░░░░░░▌░░░░▄███████▄░░░░░░░░░░▌▄▄▀▀░░░░░░░░▌░░░░▄███████▄░░░░░░░░░░▌▄▄▀▀░░░░░░░░▌░░░░▄███████▄░░░░░░░░░"
    echo "░░░░░░░░░░░░░▐░░░░▐███████████▄░░░░░░░░░░░░░░░░░░░▐░░░░▐███████████▄░░░░░░░░░░░░░░░░░░░▐░░░░▐███████████▄░░░░░░░░░░░░░░░░░░░▐░░░░▐███████████▄░░░░░░░░░░░░░░░░░░░▐░░░░▐███████████▄░░░░░░░░░░░░░░░░░░░▐░░░░▐███████████▄░░░░░░"
    echo "░░░░░le░░░░░░░▐░░░░▐█████████████▄░░░░░░░░le░░░░░░░▐░░░░▐█████████████▄░░░░░░░░le░░░░░░░▐░░░░▐█████████████▄░░░░░░░░le░░░░░░░▐░░░░▐█████████████▄░░░░░░░░le░░░░░░░▐░░░░▐█████████████▄░░░░░░░░le░░░░░░░▐░░░░▐█████████████▄░░░"
    echo "░░░░toucan░░░░░░▀▄░░░▐██████████████▄░░░░toucan░░░░░░▀▄░░░▐██████████████▄░░░░toucan░░░░░░▀▄░░░▐██████████████▄░░░░toucan░░░░░░▀▄░░░▐██████████████▄░░░░toucan░░░░░░▀▄░░░▐██████████████▄░░░░toucan░░░░░░▀▄░░░▐██████████████▄"
    echo "░░░░░░has░░░░░░░░▀▄▄████████████████▄░░░░░░has░░░░░░░░▀▄▄████████████████▄░░░░░░has░░░░░░░░▀▄▄████████████████▄░░░░░░has░░░░░░░░▀▄▄████████████████▄░░░░░░has░░░░░░░░▀▄▄████████████████▄░░░░░░has░░░░░░░░▀▄▄████████████████▄"
    echo "░░░░░arrived░░░░░░░░░░░░█▀██████░░░░░░░░░░arrived░░░░░░░░░░░░█▀██████░░░░░░░░░░arrived░░░░░░░░░░░░█▀██████░░░░░░░░░░arrived░░░░░░░░░░░░█▀██████░░░░░░░░░░arrived░░░░░░░░░░░░█▀██████░░░░░░░░░░arrived░░░░░░░░░░░░█▀██████░░░░░"
}

function toucans {
    for ((n=1;n<10;n++)); do toucan; done
}

function do_request {
    curl -X POST -F "origin_address=$ORIGIN_ADD" -F "destination_address=$DEST_ADD" localhost:3000/api/v1/directions/ | jq
}

function update_v {
    git clone https://github.com/rupa/v.git $SCRIPTS_DIR/v
    mv $SCRIPTS_DIR/v/v /usr/local/bin/vv && rm -rfv $SCRIPTS_DIR/v
}

# Update all scripts in script directory
function update_scripts {
    for script in $SCRIPTS; do
        git -C $SCRIPTS_DIR/$script pull origin master;
    done
}

# convert $1 -sampling-factor 4:2:0 -strip -interlace JPEG discord2.jpg
function jpg_convert {
    convert $1 -sampling-factor 4:2:0 -strip -interlace JPEG $(python -c "print '$1'.split('.')[0]+'2.jpg'");
}

#function dim_screen {
#    for i in `seq 1 $1`;  osascript $SCRIPTS_DIR/dim-screen.script
#}
#
#function brighten_screen {
#    for i in `seq 1 $1`;  osascript $SCRIPTS_DIR/brighten-screen.script
#}

# Uses python's json library to load, then re-dump the json from a file in a formatted style
function python_pp {
    python3 -c "import json;
with open('$1', 'r') as json_file: print(json.dumps(json.load(json_file), indent=4, sort_keys=True))"
}

# Uses the python_pp command with less wrapped around it
function pp {
    python_pp $1 | less -R
}

# Uses the python_pp command with grep wrapped around it
function ppgrep {
    python_pp $1 | grep --color=auto -n -A 3 -B 2 --color=always $2 | less -R
}

function f {
    find . -iname "*$1*"
}

if [[ "$IS_MAC" == true ]]; then
    function copy {
        pbcopy < $1
    }

    function dump {
        pbpaste > $1
    }
fi

## END CUSTOM FUNCTIONS ##
