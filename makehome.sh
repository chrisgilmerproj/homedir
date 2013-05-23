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
    ".bash"
    ".bashrc"
    ".gdbinit"
    ".gitconfig"
    ".gitignore_global"
    ".hgrc"
    ".inputrc"
    ".ipython"
    ".irbrc"
    ".screenrc"
    ".ssh/config"
    ".vim"
    ".vimrc"
    "bin")

for dot in ${DOTFILES[@]}; do
    # Must move any existing files and folders
    if [ ! -L $dot ]; then
        mv $dot $dot_old;
    fi;
    # Link the new file or folder
    ln -s $HOMEDIR/$dot $dot;
done;

source ~/.bash_profile

cd $HOMEDIR

# Ensure vim is set up
vim +BundleInstall +qall
