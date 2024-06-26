status is-interactive; or exit

if command -qv eza
  alias l 'eza -g --color-scale all --color-scale-mode gradient --git --group-directories-first --hyperlink --smart-group --time-style=iso -alhM'
  alias ll 'eza -g --color-scale all --color-scale-mode gradient --git --group-directories-first --hyperlink --smart-group --time-style=iso -lM'
  alias ls 'eza -g --color-scale all --color-scale-mode gradient --git --group-directories-first --hyperlink --smart-group --time-style=iso -M'
else if command -qv exa
  alias l 'exa --color-scale -g --git --group-directories-first --time-style=iso -alh'
  alias ll 'exa --color-scale -g --git --group-directories-first --time-style=iso -l'
  alias ls 'exa --color-scale -g --git --group-directories-first --time-style=iso'
else
  test (uname -s) = "Linux"; and set -la ls_args "--group-directories-first"
  set -la ls_args "--color=auto"

  alias l "ls $ls_args -alh"
  alias ll "ls $ls_args -lh"
  alias ls "ls $ls_args -h"
end
