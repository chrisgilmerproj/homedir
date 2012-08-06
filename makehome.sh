#! /bin/bash

# Get the submodules
git submodule init
git submodule update

# Ensure vim is set up
vim +BundleInstall +qall

# Change to the home directory
HOMEDIR=`pwd`
cd ~/

# Link all the files and dirs
DOTFILES=(
    ".ackrc"
    ".bash_profile"
    ".bash"
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

# Link the ssh config
ln -s $HOMEDIR/.ssh/config .ssh/config

cd $HOMEDIR
