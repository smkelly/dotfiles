#!/usr/bin/env bash
# broot configuration - direct translation of broot.fish

[[ $- != *i* ]] && return

if command -v broot &>/dev/null; then
  eval "$(broot --print-shell-function bash)"
fi
