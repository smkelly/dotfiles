#!/usr/bin/env zsh
# SSH keys configuration - direct translation of sshkeys.fish

if [[ "$(uname -s)" == "Darwin" ]]; then
  alias sshkeys="ssh-add --apple-load-keychain"
else
  alias sshkeys="ssh-add -A"
fi
