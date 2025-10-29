#!/usr/bin/env bash
# mcfly configuration - direct translation of mcfly.fish

[[ $- != *i* ]] && return

if command -v mcfly &>/dev/null; then
  eval "$(mcfly init bash)"
fi
