# add user bin directory to path
export PATH=$HOME/bin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/ruby/1.9.2-p180/bin:$PATH
export NODE_PATH=/usr/local/lib/node
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
export RUBY_SOURCE_DIR=/usr/local/bin/ruby
export CPLUS_INCLUDE_PATH=/usr/local/include:$CPLUS_INCLUDE_PATH

# add editor variable
export EDITOR=vim

# set the colors for the terminal
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export RI="--format ansi --width 70"

# history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

# set colors
export C_NORMAL="\033[0m\]"
export C_BLACK="\033[30m\]"
export C_RED="\033[31m\]"
export C_GREEN="\033[32m\]"
export C_YELLOW="\033[33m\]"
export C_BLUE="\033[34m\]"
export C_MAGENTA="\033[35m\]"
export C_CYAN="\033[36m\]"
export C_WHITE="\033[37m\]"

# functions
function random_prompt() {
  # Symbols from http://www.alanwood.net/unicode/miscellaneous_symbols.html
  prompts[0]="☭" # hammer & sickle
  prompts[1]="★" # star
  prompts[2]="☁" # cloud
  prompts[3]="☯" # yin-yang
  prompts[4]="♥" # heart
  prompts[5]="♦" # diamond
  prompts[6]="♣" # club
  prompts[7]="♠" # spade
  prompts[8]="♬" # music notes
  prompts[9]="☢" # radiation
  prompts[10]="☿" # mercury
  prompts[11]="♀" # venus
  prompts[12]="♁" # earth
  prompts[13]="♂" # mars
  prompts[14]="♃" # jupiter
  prompts[15]="♄" # saturn
  prompts[16]="♅" # uranus
  prompts[17]="♆" # neptune
  prompts[18]="♇" # pluto
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
export PS1="$C_GREEN\u@\h:$C_BLUE\W $C_CYAN (\$(git_current_branch))$C_WHITE\n\$(random_prompt) $C_NORMAL "
export INTERACTIVE_SHELL=1

# set alias commands
if [ "$(uname)" == 'Linux' ]; then 
    alias ls='ls -Gh --color=auto'
    alias ll='ls -al --color=auto'
else
    alias ls='ls -Gh'
    alias ll='ls -al'
fi
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

# elasticsearch
## daemon
alias esdstop="launchctl unload -wF ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist"
alias esdstart="launchctl load -wF ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist"
## manual
alias esmstart="elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.18.7/config/elasticsearch.yml"
alias esopen="open http://localhost:9200/"
alias eslog="tail -f /usr/local/var/log/elasticsearch/elasticsearch_cgilmer.log"

# Django Bash Completion
. ~/bin/django_bash_completion

# Git Bash Completion
. ~/bin/git_bash_completion

ARCHFLAGS="-arch i386 -arch x86_64"

# Get RVM Running - LAST LINE
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# WORK RELATED
export P4CLIENT=cgilmer-laptop
export P4PORT=perforce:1666
