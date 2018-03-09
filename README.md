# Required Packages

  - [`vim`](https://github.com/vim/vim)
  - [`tmux`](https://tmux.github.io/)
  - [`Vundle`](https://github.com/VundleVim/Vundle.vim)
  - [`multitail`](https://github.com/flok99/multitail)
  - [`htop`](http://hisham.hm/htop/)
  - [`tmuxinator`](https://github.com/tmuxinator/tmuxinator)
  - [`speedometer`](https://excess.org/speedometer/)
  - [`Z`](https://github.com/rupa/z)
  - [`V`](https://github.com/rupa/v)
  - [`ZSH`](https://github.com/robbyrussell/oh-my-zsh)


# (incomplete) Ubuntu Installation instructions

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
 
# Hit F12, click Preferences
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
 sudo apt-get install zsh
 wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
 chsh -s `which zsh`
 sudo shutdown -r 0
```

```
# Git
  ssh-keygen -t rsa -b 4096 -C "sturgeonb4@gmail.com"
  # Default location, no password
  cat ~/.ssh/id_rsa.pub
  # Copy ssh id
  # visit https://github.com/settings/keys, add the new key to profile
```

# Getting Dotfiles
```
git clone git@github.com:brandonsturgeon/dotfiles.git ~/_dotfiles
mv ~/_dotfiles/* ~/
mv ~/_dotfiles/.* ~/
rm -rf ~/_dotfiles
```

```
# Remove LibreOffice
 sudo apt-get remove --purge libreoffice*
 sudo apt-get clean
 sudo apt-get autoremove
```
 
```
# Vim

 # Instaling Vundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
 
 # Setting temporary files
  mkdir ~/.tmp; mkdir ~/.tmp/.vim;
  export TEMP=~/.tmp
 
 # YouCompleteMe
  sudo apt-get install build-essential cmake
  sudo apt-get install python-dev python3-dev
  cd ~/.vim/bundle/YouCompleteMe
  ./install.py --tern-completer
```


```
# Ruby
 # RVM
  sudo apt-get install software-properties-common
  sudo apt-add-repository -y ppa:rael-gc/rvm
  sudo apt-get update
  sudo apt-get install rvm
  sudo shutdown -r 0
 
 rvm install ruby
```

```
# Python
 sudo apt install python-pip; pip install --upgrade pip`
 sudo apt-get install python-dev
 sudo apt-get install libxml2-dev
 sudo apt-get install libxslt1-de
 sudo pip install bs4
 sudo pip install blessings
 sudo pip install lxml
```

```
# Silver Searcher
 sudo apt install silversearcher-ag
```
