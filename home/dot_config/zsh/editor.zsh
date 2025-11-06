#!/usr/bin/env zsh
# Editor configuration - direct translation of editor.fish

[[ -o interactive ]] || return

local found=""

# Need "" on the end so $found is empty if none found
for editor in nvim vim vi ""; do
  type "$editor" &>/dev/null && found="$editor" && break
done

[[ -n "$found" ]] || return

# Create abbreviations/aliases for editors not found
for x in nvim vim vi; do
  [[ "$x" != "$found" ]] && alias "$x"="$found"
done

[[ -z "$EDITOR" ]] && export EDITOR="$(type -p "$found")"

if command -v code &>/dev/null; then
  export VISUAL="$(type -p code) --wait"
else
  export VISUAL="$(type -p "$found")"
fi
