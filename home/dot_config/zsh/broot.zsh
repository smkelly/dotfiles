#!/usr/bin/env zsh
# broot configuration - direct translation of broot.fish

[[ -o interactive ]] || return

command -v broot &>/dev/null && eval "$(broot --print-shell-function zsh)"
