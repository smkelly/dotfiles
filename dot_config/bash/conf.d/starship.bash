#!/usr/bin/env bash
# Starship prompt configuration - direct translation of starship.fish

[[ $- != *i* ]] && return

# Override to disable it
[ -n "$DISABLE_STARSHIP" ] && return

if command -v starship &>/dev/null; then
  [ -r ~/.config/starship.toml ]
  eval "$(starship init bash)"
  # Note: enable_transience is fish-specific, bash doesn't have equivalent
fi
