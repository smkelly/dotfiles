status is-interactive; or exit

command -qv exa; and begin
  alias l 'exa --color-scale -g --git --group-directories-first --time-style=iso -alh'
  alias ll 'exa --color-scale -g --git --group-directories-first --time-style=iso -l'
  alias ls 'exa --color-scale -g --git --group-directories-first --time-style=iso'
end; or begin
  test (uname -s) = "Linux"; and set -la ls_args "--group-directories-first"
  set -la ls_args "--color=auto"

  alias l "ls $ls_args -alh"
  alias ll "ls $ls_args -lh"
  alias ls "ls $ls_args -h"
end
