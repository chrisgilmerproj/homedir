#! /bin/bash

CWD="$( pwd )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get the submodules
cd ${DIR}
git submodule init
git submodule update
cd ${CWD}

# Link all the files and dirs
DOTFILES=(
    ".ackrc"
    ".bash_profile"
    ".bash"
    ".bashrc"
    ".config"
    ".gdbinit"
    ".gemrc"
    ".gitconfig"
    ".gitignore_global"
    ".hgrc"
    ".inputrc"
    ".ipython"
    ".irbrc"
    ".screenrc"
    ".ssh/config"
    ".tmux.conf"
    ".vim"
    ".vimrc"
    "bin")

for dot in ${DOTFILES[@]}; do
    if [ ! -L ~/$dot ]; then
        if [ -f ~/$dot ]; then
            # Must move any existing files and folders
            mv -f ~/$dot ~/$dot-old;
        fi;
        # Link the new file or folder
        ln -s ${DIR}/$dot ~/$dot;
    fi;
done;

source ~/.bash_profile
