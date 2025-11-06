#!/usr/bin/env zsh
# Starship prompt configuration - direct translation of starship.fish

[[ -o interactive ]] || return

# Override to disable it
[[ -n "$DISABLE_STARSHIP" ]] && return

if command -v starship &>/dev/null && [[ -r ~/.config/starship.toml ]]; then
  eval "$(starship init zsh)"

  # Enable transient prompt (zsh uses different mechanism than fish)
  # This requires starship >= 1.10.0
  function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
  }
  precmd_functions+=(set_win_title)
fi
