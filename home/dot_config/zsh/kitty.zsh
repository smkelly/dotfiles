#!/usr/bin/env zsh
# Kitty terminal configuration - direct translation of kitty.fish

[[ -o interactive ]] || return
[[ "$TERM" == "xterm-kitty" ]] || return
command -v kitten &>/dev/null || return

alias icat='kitten icat'
alias kssh='kitten ssh'

if [[ -n "$SSH_TTY" ]]; then
  alias pbcopy="kitten clipboard"
  alias pbpaste="kitten clipboard -g"
fi
