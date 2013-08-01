#! /bin/bash

# Get the submodules
git submodule init
git submodule update

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
    if [ ! -L ~/$dot ]; then
        # Must move any existing files and folders
        mv ~/$dot ~/$dot-old;
        # Link the new file or folder
        ln -s $dot ~/$dot;
    fi;
done;

source ~/.bash_profile

# Ensure vim is set up
vim +BundleInstall +qall < `tty` > `tty`
