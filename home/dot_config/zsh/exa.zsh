#!/usr/bin/env zsh
# ls/eza/exa configuration - direct translation of exa.fish

[[ -o interactive ]] || return

if command -v eza &>/dev/null; then
  alias l='eza -g --color-scale all --color-scale-mode gradient --git --group-directories-first --hyperlink --smart-group --time-style=iso -alhM'
  alias ll='eza -g --color-scale all --color-scale-mode gradient --git --group-directories-first --hyperlink --smart-group --time-style=iso -lM'
  alias ls='eza -g --color-scale all --color-scale-mode gradient --git --group-directories-first --hyperlink --smart-group --time-style=iso -M'
elif command -v exa &>/dev/null; then
  alias l='exa --color-scale -g --git --group-directories-first --time-style=iso -alh'
  alias ll='exa --color-scale -g --git --group-directories-first --time-style=iso -l'
  alias ls='exa --color-scale -g --git --group-directories-first --time-style=iso'
else
  local ls_args=()
  [[ "$(uname -s)" == "Linux" ]] && ls_args+=(--group-directories-first)
  ls_args+=(--color=auto)

  alias l="ls ${ls_args[*]} -alh"
  alias ll="ls ${ls_args[*]} -lh"
  alias ls="ls ${ls_args[*]} -h"
fi
