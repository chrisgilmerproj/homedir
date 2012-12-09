# add user bin directory to path
export PATH=$HOME/bin:/usr/local/share/python:/usr/local/lib/wxPython/bin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/local/Cellar/ruby/1.9.2-p180/bin:$PATH
export NODE_PATH=/usr/local/lib/node
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
export RUBY_SOURCE_DIR=/usr/local/bin/ruby
export CPLUS_INCLUDE_PATH=/usr/local/include:$CPLUS_INCLUDE_PATH

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
export PS1="$C_GREEN\u@\h:$C_BLUE\W $C_CYAN (\$(git_current_branch))$C_WHITE\n$ $C_NORMAL "
export INTERACTIVE_SHELL=1

# ROS
if [ -d /opt/ros/fuerte ]; then
    source /opt/ros/fuerte/setup.bash
    export ROS_OS_OVERRIDE=osx:homebrew
    export ROS_PACKAGE_PATH=$HOME/Projects/ros_workspace:$ROS_PACKAGE_PATH
    export ROS_WORKSPACE=$HOME/Projects/ros_workspace
fi

# Get RVM Running - LAST LINE
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

. $HOME/.bash/aliases
. $HOME/.bash/functions
. $HOME/.bash/options

for i in $(ls $HOME/.bash/completions); do
    . $HOME/.bash/completions/$i;
done

[[ -f $HOME/.bash_local ]] && . $HOME/.bash_local

# Activate virtualenv on machines that have them installed
if [ -d ~/env ]; then
    if [ ! -f ~/activate ]; then
        ln -s ~/env/bin/activate ~/activate
    fi
    source ~/activate
fi

# Useful for numpy
export ARCHFLAGS="-arch i386 -arch x86_64"
export CC=clang
