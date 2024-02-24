status is-interactive; or exit

# Override to disable it
test "$DISABLE_STARSHIP"; and exit

command -qv starship; and \
  test -r ~/.config/starship.toml; and \
  starship init fish | source

