# add user bin directory to path
export PATH=$HOME/bin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/ruby/1.9.2-p180/bin:$PATH
export NODE_PATH=/usr/local/lib/node
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
export RUBY_SOURCE_DIR=/usr/local/bin/ruby

# add editor variable
export EDITOR=vim

# set the colors for the terminal
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# set the prompt for the terminal
export PS1='\[\033[34m\]\u@\h:\W $(parse_git_branch)\$\[\033[0m\] '
export INTERACTIVE_SHELL=1

# set the prompt for interactive shells
# http://en.tldp.org/HOWTO/Bash-Prompt-HOWTO/
parse_git_branch() {
    # returns '(git branch name) ' if inside git directory, 
    # otherwise returns ''
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# set alias commands
alias ls='ls -Gh'
alias ll='ls -al'
alias maketar='tar -pczf'
alias untar='tar -xvf'
alias sethostname='scutil –set HostName'

# postgresql
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# Django Bash Completion
. /usr/local/bin/django_bash_completion

# Git Bash Completion
. /usr/local/bin/git_bash_completion

ARCHFLAGS="-arch i386 -arch x86_64"
