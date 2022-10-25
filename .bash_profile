
export GOPATH=~/.go
export PYENV_ROOT=$HOME/.pyenv
export PATH=./node_modules/.bin:$HOME/.npm-packages/bin:$GOPATH/bin:$PATH
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"

# OS Specific Modifications
[[ "$(uname)" == 'Linux'  &&  -f "${HOME}/.bash_linux" ]] && . "${HOME}/.bash_linux"
[[ "$(uname)" == 'Darwin'  &&  -f "${HOME}/.bash_darwin" ]] && . "${HOME}/.bash_darwin"

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/sbin:$PATH

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

# shellcheck disable=SC2086,SC2231
for i in ${HOME}/.bash/completions/*; do
  # shellcheck disable=SC1090
  . "${i}";
done

# Pyenv
hash pyenv &>/dev/null && eval "$(pyenv init -)"

# nodenv
hash nodenv &>/dev/null && eval "$(nodenv init -)"

# starship prompt
hash starship &>/dev/null && eval "$(starship init bash)"

export LC_ALL=en_US.UTF-8

# RipGrep
export RIPGREP_CONFIG_PATH="${HOME}"/.ripgreprc

# https://direnv.net
hash direnv &>/dev/null && eval "$(direnv hook bash)"

# GPG
GPG_TTY=$(tty)
export GPG_TTY

# Local modifications should come last
# shellcheck disable=SC1090
[ -f "${HOME}/.bash_local" ] && . "${HOME}/.bash_local"

# shellcheck disable=SC1090
. "${HOME}/.bash/aliases"
# shellcheck disable=SC1090
. "${HOME}/.bash/functions"
# shellcheck disable=SC1090
. "${HOME}/.bash/options"

