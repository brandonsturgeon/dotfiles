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
  sudo apt-get update
  sudo apt-get install -y curl gnupg build-essential
  sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -sSL https://get.rvm.io -o ~/._rvm_install
  # Inspect the downloaded script (jk I know you won't)
  less ~/._rvm_install
  cat ~/._rvm_install | sudo bash -s stable
  sudo usermod -a -G rvm `whoami`

 rvm install ruby
 rvm --default use ruby
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
