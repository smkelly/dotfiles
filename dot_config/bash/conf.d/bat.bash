#!/usr/bin/env bash
# bat configuration - direct translation of bat.fish

[[ $- != *i* ]] && return

command -v bat &>/dev/null && alias cat='bat -p'
