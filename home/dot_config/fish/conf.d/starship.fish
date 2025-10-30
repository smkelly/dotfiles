status is-interactive; or exit

# Override to disable it
test "$DISABLE_STARSHIP"; and exit

command -qv starship; and begin
  test -r ~/.config/starship.toml
  starship init fish | source
  enable_transience
end
