#! /bin/bash

# Link all the dotfiles
ln -s .ackrc ~/.ackrc
ln -s .bash_profile ~/.bash_profile
ln -s .bashrc ~/.bashrc
ln -s .gitconfig ~/.gitconfig
ln -s .gitignore_global ~/.gitignore_global
ln -s .hgrc ~/.hgrc
ln -s .inputrc ~/.inputrc
ln -s .ipython ~/.ipython
ln -s .irbrc ~/.irbrc
ln -s .screenrc ~/.screenrc
ln -s .vim ~/.vim
ln -s .vimrc ~/.vimrc

# Get the submodules
git submodule init
git submodule update

# Link the bin directory
HOMEDIR=`pwd`
cd ~/
ln -s $HOMEDIR/bin .


