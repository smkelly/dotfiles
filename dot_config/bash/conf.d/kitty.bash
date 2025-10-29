#!/usr/bin/env bash
# Kitty terminal configuration - direct translation of kitty.fish

[[ $- != *i* ]] && return

[ "$TERM" != "xterm-kitty" ] && return

command -v kitten &>/dev/null || return

alias icat='kitten icat'
alias kssh='kitten ssh'

if [ -n "$SSH_TTY" ]; then
  alias pbcopy="kitten clipboard"
  alias pbpaste="kitten clipboard -g"
fi
