# add user bin directory to path
export PYENV_ROOT=$HOME/.pyenv
export PATH=$HOME/bin:$PYENV_ROOT/shims:/usr/local/bin:/usr/local/sbin:/sbin:$PATH
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

# if [ -z "$CPLUS_INCLUDE_PATH" ]; then
#     export CPLUS_INCLUDE_PATH=/usr/local/include
# else
#     export CPLUS_INCLUDE_PATH=/usr/local/include:$CPLUS_INCLUDE_PATH
# fi

# add editor variable
hash vim &>/dev/null && export EDITOR=vim

# set the colors for the terminal
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export RI="--format ansi --width 70"

# set colors
export C_NORMAL="\[\033[0m\]"
export C_BLACK="\[\033[30m\]"
export C_RED="\[\033[31m\]"
export C_GREEN="\[\033[32m\]"
export C_YELLOW="\[\033[33m\]"
export C_BLUE="\[\033[34m\]"
export C_MAGENTA="\[\033[35m\]"
export C_CYAN="\[\033[36m\]"
export C_WHITE="\[\033[37m\]"

# Set up prompt
export PS1="$C_GREEN\u@\h:$C_BLUE\W $C_CYAN (\$(git_current_branch))$C_WHITE $ $C_NORMAL "
export INTERACTIVE_SHELL=1

. $HOME/.bash/aliases
. $HOME/.bash/functions
. $HOME/.bash/options

for i in $(ls $HOME/.bash/completions); do
    . $HOME/.bash/completions/$i;
done

[[ -f $HOME/.bash_local ]] && . $HOME/.bash_local

# Useful for numpy
# you may need to export these
ARCHFLAGS="-arch i386 -arch x86_64"
CC=clang

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
