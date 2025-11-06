#!/usr/bin/env zsh
# McFly configuration - direct translation of mcfly.fish

[[ -o interactive ]] || return

command -v mcfly &>/dev/null && eval "$(mcfly init zsh)"
