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
export RI="--format ansi --width 70"

export C_NORMAL="\033[0m\]"
export C_BLACK="\033[30m\]"
export C_RED="\033[31m\]"
export C_GREEN="\033[32m\]"
export C_YELLOW="\033[33m\]"
export C_BLUE="\033[34m\]"
export C_MAGENTA="\033[35m\]"
export C_CYAN="\033[36m\]"
export C_WHITE="\033[37m\]"

# set the prompt for the terminal
prompts[0]="☭"
prompts[1]="★"
prompts[2]="☁"
prompts[3]="☯"
prompts[4]="♡"
prompts[5]="♢"
prompts[6]="♧"
prompts[7]="♤"
prompts[8]="♬"

# functions
function random_prompt() {
  echo "${prompts[RANDOM % ${#prompts[@]}]}"
}

function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

function git_current_origin() {
  git config --get remote.origin.url | sed -e 's/^.*\://' | sed -e 's/\.git.*//'
}

function git_ref_origin() {
  git rev-parse origin
}

function git_ref_head() {
  git rev-parse HEAD
}

function fe() {
  find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;
}

# Set up prompt
export PS1="$C_GREEN\u@\h:$C_BLUE\W $C_CYAN($(git_current_branch))$C_WHITE \n$(random_prompt) $C_NORMAL "
export INTERACTIVE_SHELL=1

# set alias commands
alias ls='ls -Gh'
alias ll='ls -al'
alias maketar='tar -pczf'
alias untar='tar -xvf'
alias sethostname='scutil –set HostName'
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias fsleep="osascript -e 'tell the application \"Finder\" to sleep'"
alias screensaver="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"
alias rmpyc='find . -name "*.pyc" -exec rm {} \;'

# git
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias gpfthis='git push -f origin HEAD:$(git_current_branch)'
alias gpr='open "https://github.com/$(git_current_origin)/pull/new/$(git_current_branch)"'
alias gcompare='open "http://github.com/$(git_current_origin)/compare/$(git_ref_origin)...$(git_ref_head)"'

# postgresql
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# mongodb
alias mdbstart="mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf"

# Django Bash Completion
. /usr/local/bin/django_bash_completion

# Git Bash Completion
. /usr/local/bin/git_bash_completion

ARCHFLAGS="-arch i386 -arch x86_64"

# Get RVM Running - LAST LINE
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# WORK RELATED
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vdestroy="vagrant destroy"
alias vssh="vagrant ssh"
alias vnew="vagrant destroy; rake; vagrant up; vagrant ssh"
