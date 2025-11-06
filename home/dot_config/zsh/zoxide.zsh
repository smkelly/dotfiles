#!/usr/bin/env zsh
# Zoxide configuration - direct translation of zoxide.fish

[[ -o interactive ]] || return

command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
