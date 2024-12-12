#!/usr/bin/env zsh

[[ "$(uname)" == 'Darwin'  &&  -f "${HOME}/.zprofile_darwin" ]] && . "${HOME}/.zprofile_darwin"

export PATH="$PATH:$HOME/bin:./node_modules/.bin:$HOME/.npm-packages/bin:/usr/bin:/bin:/usr/local/bin:/usr/local/sbin:/sbin"

# aws cli
export AWS_PAGER="less"

# less
export LESS="-R"

# Node settings
export NODE_ENV=development

# add editor variable
hash vim &>/dev/null && export EDITOR=vim

# set the colors for the terminal
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export RI="--format ansi --width 70"

# Set up prompt
export INTERACTIVE_SHELL=1

# Disable stupid ansible cows
export ANSIBLE_NOCOWS=1

# nodenv
hash nodenv &>/dev/null && eval "$(nodenv init -)"

# starship prompt
hash starship &>/dev/null && eval "$(starship init zsh)"

export LC_ALL=en_US.UTF-8

# RipGrep
export RIPGREP_CONFIG_PATH="${HOME}"/.ripgreprc

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# https://direnv.net
hash direnv &>/dev/null && eval "$(direnv hook zsh)"

# GPG
GPG_TTY=$(tty)
export GPG_TTY

# Enhanced history search and suggestions
setopt inc_append_history      # Write commands to history immediately
setopt share_history           # Share history between terminals
setopt hist_ignore_all_dups    # Ignore duplicate commands
setopt hist_find_no_dups       # Remove duplicates during history search

# Enable history search with partial matches
bindkey '^[[A' history-search-backward   # Up arrow
bindkey '^[[B' history-search-forward    # Down arrow

# Configure history size
HISTSIZE=5000            # Number of commands to keep in memory
SAVEHIST=5000            # Number of commands to save in history file
HISTFILE=~/.zsh_history  # Location of the history file

# Local modifications should come last
# shellcheck disable=SC1090
[ -f "${HOME}/.zprofile_local" ] && . "${HOME}/.zprofile_local"

# shellcheck disable=SC1090
. "${HOME}/.zsh/aliases"
# shellcheck disable=SC1090
. "${HOME}/.zsh/functions"

