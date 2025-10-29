#!/usr/bin/env bash
# Editor configuration - direct translation of editor.fish

[[ $- != *i* ]] && return

found=""

# Need "" on the end so $found is empty if none found
for editor in nvim vim vi ""; do
  if type -P "$editor" &>/dev/null; then
    found="$editor"
    break
  fi
done

[ -z "$found" ] && return

# Create aliases for editors not found
for x in nvim vim vi; do
  if [ "$x" != "$found" ]; then
    alias "$x"="$found"
  fi
done

[ -z "$EDITOR" ] && export EDITOR="$(type -P "$found")"

if command -v code &>/dev/null; then
  export VISUAL="$(type -P code) --wait"
else
  export VISUAL="$(type -P "$found")"
fi
