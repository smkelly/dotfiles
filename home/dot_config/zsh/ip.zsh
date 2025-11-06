#!/usr/bin/env zsh
# ip command colorization - direct translation of ip.fish

[[ -o interactive ]] || return
[[ "$(uname -s)" == "Linux" ]] || return

ip() {
  command ip --color=auto "$@"
}
