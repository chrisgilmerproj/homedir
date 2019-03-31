# add user bin directory to path
export GOPATH=~/Projects/go
export PYENV_ROOT=$HOME/.pyenv
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/openssl/bin:/sbin:$PATH
export PATH=$PATH:/usr/local/opt/go@1.11/libexec/bin
export PATH=$PATH:./node_modules/.bin:$HOME/.npm-packages/bin:$GOPATH/bin
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

. $HOME/.bash/aliases
. $HOME/.bash/functions
. $HOME/.bash/options

for i in $(ls $HOME/.bash/completions); do
    . $HOME/.bash/completions/$i;
done

complete -C /usr/local/Cellar/terraform/0.11.10/bin/terraform terraform

# Useful for numpy
# you may need to export these
ARCHFLAGS="-arch i386 -arch x86_64"
CC=clang

eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Help me
eval $(thefuck --alias)

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/cgilmer/.nvm/versions/node/v7.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/cgilmer/.nvm/versions/node/v7.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/cgilmer/.nvm/versions/node/v7.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/cgilmer/.nvm/versions/node/v7.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

# Powerline
powerline-daemon -q
export POWERLINE_BASH_CONTINUATION=1
export POWERLINE_BASH_SELECT=1
. /Users/cgilmer/.pyenv/versions/3.7.2/Python.framework/Versions/3.7/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
export LC_ALL=en_US.UTF-8

# https://direnv.net
if command -v direnv >/dev/null; then
    eval "$(direnv hook bash)"
fi

# Local modifications should come last
[[ -f $HOME/.bash_local ]] && . $HOME/.bash_local
