status is-interactive; or exit

test "$TERM" = "xterm-kitty"; or exit

command -qv kitten; or exit

alias icat 'kitten icat'
alias kssh 'kitten ssh'

test "$SSH_TTY"; and \
  alias pbcopy="kitten clipboard"; and \
  alias pbpaste="kitten clipboard -g"
