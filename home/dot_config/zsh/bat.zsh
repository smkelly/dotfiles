#!/usr/bin/env zsh
# bat configuration - direct translation of bat.fish

[[ -o interactive ]] || return

command -v bat &>/dev/null && alias cat='bat -p'
