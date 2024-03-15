if test -x /opt/homebrew/bin/brew
  /opt/homebrew/bin/brew shellenv | source
  set -gx HOMEBREW_AUTOREMOVE 1
  command -q bat; and set -g HOMEBREW_BAT 1
  set -gx HOMEBREW_NO_ENV_HINTS 1
end

