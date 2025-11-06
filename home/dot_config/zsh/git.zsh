#!/usr/bin/env zsh
# Git configuration - direct translation of git.fish

[[ -o interactive ]] || return

if type hub &>/dev/null; then
  git() {
    hub "$@"
  }
fi

alias ga="git add"
alias gclone="git clone"
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias gl="git pull"
alias gmv="git mv"
alias gp="git push"
alias grm="git rm"
alias gs="git status --short"
