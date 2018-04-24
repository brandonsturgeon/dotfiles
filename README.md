# Required Packages
  - [`speedometer`](https://excess.org/speedometer/)


# (incomplete) Ubuntu Installation instructions
Follow in order. Sections are listed in order of requirements (eg: some sections require packages installed in previous sections)

---

```
 # Setting temporary files
  mkdir ~/.tmp; mkdir ~/.tmp/.vim;
  export TEMP=~/.tmp;
```

```
# Guake
 sudo apt-get install guake
# Open Ubuntu Software Manager, search for Guake.
# Click "launch"
# Right click on the Guake icon in the launcher, click "Lock to Launcher"

# Fixing alt-tab lose-focus bug (seriously it's really annoying, do this and keep up with this issue: https://github.com/Guake/guake/issues/45)
 sudo apt-get install compizconfig-settings-manager
 # Open Ubuntu Software Manager, search for Compiz - click on CompizConfigSettingsManager
 # Click "launch"
 # Go to _Ubuntu Unity Plugin_ -> _Switcher tab_ -> Check _Disable Show Desktop in the Switcher_.
 
# Hit F12, right click inside of the terminal, click Preferences
# General
 # - Main Window Height slider to max
# Shell
 # - Check "Run command as a login shell"
# Scrolling
 # - Scrollback lines to to 10240
# Appearance
 # Built-in schemes to "Solarized Dark Higher Contrast"
 # Transparency to ~5-10%
# Quick Open
 # Enable Quick Open when ctrl-clicking
 # Editor command line: `vim +%(line_numbers) %(file_path)s`
# Keyboard Shortcuts
 # New Tab: `Ctrl+T`
 # Close Tab: `Ctrl+W`
 # Go to previous tab: `Ctrl+{`
 # Go to next tab: `Ctrl+}`

```

```
# ZSH
 sudo apt-get install zsh;
 wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh;
 chsh -s `which zsh`;
 sudo shutdown -r 0;
```

```
# Git
  ssh-keygen -t rsa -b 4096 -C "sturgeonb4@gmail.com";
  # Default location, no password
  cat ~/.ssh/id_rsa.pub;
  # Copy ssh id
  # visit https://github.com/settings/keys, add the new key to profile
```

```
 # Getting Dotfiles
  git clone git@github.com:brandonsturgeon/dotfiles.git ~/_dotfiles;
  mv ~/_dotfiles/* ~/;
  mv ~/_dotfiles/.* ~/;
  rm -rf ~/_dotfiles;
  
  source ~/.profile ~/.zshrc
```

```
# Tmux
  sudo apt-get install libevent-dev libncurses-dev pkg-config;
  autoreconf -fis;
  git clone https://github.com/tmux/tmux.git ~/.tmp;
  cd ~/.tmp/tmux
  sh autogen.sh;
  ./configure && make;
  # Below may not be necessary
  sudo make install;
  
  # Tmuxinator (https://github.com/tmuxinator/tmuxinator)
   gem install tmuxinator;
```

```
# Remove LibreOffice
 sudo apt-get remove --purge libreoffice*;
 sudo apt-get clean;
 sudo apt-get autoremove;
```

```
# Installing Yarn
 curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -;
 echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list;
 sudo apt-get update && sudo apt-get install yarn;
```
 ```
# Python
 sudo apt install python-pip && pip install --upgrade pip;
 sudo -H pip install --upgrade pip;
 sudo apt-get install python-dev python3-dev libxml2-dev libxslt1-dev python-apt python-pycurl python-software-properties;
 sudo apt-get update;
 sudo -H pip install bs4 blessings lxml;
```

```
# Ruby
 # RVM
  sudo apt-get install ruby-dev software-properties-common;
  sudo apt-add-repository -y ppa:rael-gc/rvm;
  sudo apt-get update;
  sudo apt-get install rvm;
  sudo shutdown -r 0;
 
 # --enable-shared is required to build vim from source
 rvm install ruby --enable-shared;
 gem install bundler
```

```
# Node
 # NVM
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash;
  export NVM_DIR="$HOME/.nvm";
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";
  nvm install node;
  nvm use node;
```

```
# Rails
 sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev;
 gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB;
 gem install rails -v 5.1.4;
 sudo apt autoremove;
 rails -v;
```

```
# PostgreSQL
 sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list";
 wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -;
 sudo apt-get update;
 sudo apt-get install postgresql-common postgresql-9.5 libpq-dev;
 # Fixes weird permission error when trying to create a new user with postgres
 chmod og+X /home /home/`whoami`
 sudo -u postgres createuser brandon -s
```

```
# Vim

 # Building Vim from source
  sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev;
  sudo apt-get update;
  sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox;
  cd ~;
  git clone https://github.com/vim/vim.git;
  cd vim;
  ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local;
  make VIMRUNTIMEDIR=/usr/local/share/vim/vim80;
  cd ~/vim;
  sudo make install;
  sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1;
  sudo update-alternatives --set editor /usr/local/bin/vim;
  sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1;
  sudo update-alternatives --set vi /usr/local/bin/vim;
  
  # Verify that vim installed correctly
  vim --version;
  
  # Remove the install folder
  rm -rf ~/vim
  
 # Instaling Vundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
  vim +PluginInstall +qall;
 
 # YouCompleteMe
  sudo apt-get install build-essential cmake;
  cd ~/.vim/bundle/YouCompleteMe;
  ./install.py --tern-completer;
```

```
# Silver Searcher
 sudo apt install silversearcher-ag;
```

```
# Htop
 sudo apt-get install htop
```

```
# Disable CUPS
systemctl stop cups;
systemctl stop cups-browsed;
systemctl disable cups;
systemctl disable cups-browsed;
```

```
# (For servers) Disable password authentication
# NOTE: Ensure you've already added your public key to ~/.ssh/authorized_keys or you'll lock yourself out
sudo vi /etc/ssh/sshd_config;
# Update these lines as follows:
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
PermitRootLogin no

# Then run this command:
sudo /etc/init.d/ssh reload;
```

```
# Docker
sudo apt-get remove docker docker-engine docker.io;
sudo apt-get update;
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
sudo apt-key fingerprint 0EBFCD88;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
sudo apt-get update;
sudo apt-get install docker-ce;
sudo docker run hello-world;
```
