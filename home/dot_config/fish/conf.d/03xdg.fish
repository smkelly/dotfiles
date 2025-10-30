set -q XDG_DATA_HOME; or \
  set -gx --path XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CONFIG_HOME; or \
  set -gx --path XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_STATE_HOME; or \
  set -gx --path XDG_STATE_HOME "$HOME/.local/state"
set -q XDG_CACHE_HOME; or \
  set -gx --path XDG_CACHE_HOME "$HOME/.cache"

set -gx --path XDG_DESKTOP_DIR    "$HOME/Desktop"
set -gx --path  XDG_DOCUMENTS_DIR "$HOME/Documents"
set -gx --path XDG_DOWNLOAD_DIR    "$HOME/Downloads"
set -gx --path XDG_MUSIC_DIR       "$HOME/Music"
set -gx --path XDG_PICTURES_DIR    "$HOME/Pictures"
set -gx --path XDG_PUBLICSHARE_DIR "$HOME/Public"
set -gx --path XDG_TEMPLATES_DIR   "$HOME/Templates"
set -gx --path XDG_VIDEOS_DIR      "$HOME/Movies"

