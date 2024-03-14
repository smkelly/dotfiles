set -q XDG_DATA_HOME; or \
  set -gx --path XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CONFIG_HOME; or \
  set -gx --path XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_STATE_HOME; or \
  set -gx --path XDG_STATE_HOME "$HOME/.local/state"
set -q XDG_CACHE_HOME; or \
  set -gx --path XDG_CACHE_HOME "$HOME/.cache"

