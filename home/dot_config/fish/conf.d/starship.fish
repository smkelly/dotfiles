status is-interactive; or exit

if not test -t 1; or not test -n "$TERM"; or test "$TERM" = "dumb"
  return
end

# Enable Starship only when requested.
test "$ENABLE_STARSHIP_PROMPT"; or exit

command -qv starship; and begin
  test -r ~/.config/starship.toml
  starship init fish | source
  enable_transience
end
