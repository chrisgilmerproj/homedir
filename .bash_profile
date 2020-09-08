# add user bin directory to path
export GOPATH=~/.go
export PYENV_ROOT=$HOME/.pyenv
export PATH=$HOME/.cargo/bin:./node_modules/.bin:$HOME/.npm-packages/bin:$GOPATH/bin:$PATH
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/openssl/bin:/sbin:$PATH

# coreutils should come first
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$(manpath)"
export MANPATH

# Node settings
export NODE_ENV=development

# add editor variable
hash vim &>/dev/null && export EDITOR=vim

# set the colors for the terminal
export TERM=xterm-256color
export CLICOLOR=1
# export GREP_OPTIONS='--color=always' # v2.5.1
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
# export PS1="$C_GREEN\u@\h:$C_BLUE\W $C_CYAN (\$(git_current_branch))$C_WHITE $ $C_NORMAL "
export INTERACTIVE_SHELL=1

# Disable stupid ansible cows
export ANSIBLE_NOCOWS=1

# shellcheck disable=SC1090
. "${HOME}/.bash/aliases"
# shellcheck disable=SC1090
. "${HOME}/.bash/functions"
# shellcheck disable=SC1090
. "${HOME}/.bash/options"

# shellcheck disable=SC2086,SC2231
for i in ${HOME}/.bash/completions/*; do
  # shellcheck disable=SC1090
  . "${i}";
done

# complete -C /usr/local/Cellar/terraform/0.11.10/bin/terraform terraform

# Useful for numpy
# you may need to export these
# ARCHFLAGS="-arch i386 -arch x86_64"
# CC=clang

# eval "$(nodenv init -)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1090
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# shellcheck disable=SC1090
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Help me
eval "$(thefuck --alias)"

# Powerline
if command -v powerline-daemon >/dev/null; then
  powerline-daemon -q
  export POWERLINE_BASH_CONTINUATION=1
  export POWERLINE_BASH_SELECT=1
  PY_VERSION_SHORT=3.8
  PY_VERSION="${PY_VERSION_SHORT}.5"
  if [ -d "/Users/cgilmer/.pyenv/versions/${PY_VERSION}/" ]; then
    # shellcheck disable=SC1090
    . "/Users/cgilmer/.pyenv/versions/${PY_VERSION}/Python.framework/Versions/${PY_VERSION_SHORT}/lib/python${PY_VERSION_SHORT}/site-packages/powerline/bindings/bash/powerline.sh"
  fi
fi
export LC_ALL=en_US.UTF-8

# RipGrep
export RIPGREP_CONFIG_PATH=/Users/cgilmer/.ripgreprc

# https://direnv.net
if command -v direnv >/dev/null; then
  eval "$(direnv hook bash)"
fi

# aws cli
export AWS_PAGER=""

# gnutls
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

# GPG activity like setting up verified git commits using GPG and Keybase.io
GPG_TTY=$(tty)
export GPG_TTY

# #Enable SSH Key on Yubikey Device
# killall gpg-agent ssh-agent > /dev/null 2>&1
# unset GPG_AGENT_INFO SSH_AGENT_PID SSH_AUTH_SOCK
# eval $( gpg-agent --daemon --enable-ssh-support )

# Enable SSH Key on Yubikey Device
# if [ -S "${HOME}/.gnupg/S.gpg-agent.ssh" ]; then
#   export SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh
# fi

export PATH="$HOME/.cargo/bin:$PATH"

# Local modifications should come last
# shellcheck disable=SC1090
[ -f "${HOME}/.bash_local" ] && . "${HOME}/.bash_local"
