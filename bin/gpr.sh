function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

function git_current_origin() {
  git config --get remote.origin.url | sed -e 's/^.*\://' | sed -e 's/\.git.*//'
}

alias gpr='open "https://github.com/$(git_current_origin)/pull/new/$(git_current_branch)"'
