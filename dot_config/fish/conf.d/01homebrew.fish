if test -x /opt/homebrew/bin/brew
  /opt/homebrew/bin/brew shellenv | source
  command -q bat; and set -g HOMEBREW_BAT 1
  set -gx HOMEBREW_NO_ENV_HINTS 1
end

