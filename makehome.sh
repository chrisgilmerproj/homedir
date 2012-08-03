#! /bin/bash

# Get the submodules
git submodule init
git submodule update

# Change to the home directory
HOMEDIR=`pwd`
cd ~/

# Link all the files and dirs
DOTFILES=(
    ".ackrc"
    ".bash_profile"
    ".bashrc"
    ".gitconfig"
    ".gitignore_global"
    ".hgrc"
    ".inputrc"
    ".ipython"
    ".irbrc"
    ".screenrc"
    ".vim"
    ".vimrc"
    "bin")

for dot in ${DOTFILES[@]}; do
    ln -s $HOMEDIR/$dot .;
done;

cd $HOMEDIR
