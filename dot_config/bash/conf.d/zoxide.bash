#!/usr/bin/env bash
# zoxide configuration - direct translation of zoxide.fish

[[ $- != *i* ]] && return

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi
