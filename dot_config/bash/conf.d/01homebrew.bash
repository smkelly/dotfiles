#!/usr/bin/env bash
# Homebrew configuration - direct translation of 01homebrew.fish

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  command -v bat &>/dev/null && export HOMEBREW_BAT=1
  export HOMEBREW_NO_ENV_HINTS=1
fi
