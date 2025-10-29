#!/usr/bin/env bash
# ip command colorization - direct translation of ip.fish

[[ $- != *i* ]] && return
[ "$(uname -s)" != "Linux" ] && return

ip() {
  command ip --color=auto "$@"
}
