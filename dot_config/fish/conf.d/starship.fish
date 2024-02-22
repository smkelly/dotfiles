status is-interactive; or exit

# Override to disable it
test "$DISABLE_STARSHIP"; and exit

command -qv starship; and \
  test -r ~/.config/starship.toml; and \
  eval (starship init fish)

