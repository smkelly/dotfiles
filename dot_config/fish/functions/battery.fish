function battery --description 'Show system battery status'
  set -l data
  set -l level
  set -l state
  set -l color
  set -l cmd (status current-command)

  if test (uname) = "Darwin"
    set data (pmset -g batt | egrep -o "([0-9]+\%).*")
    set level (echo $data | cut -d';' -f1)
    set state (string trim (echo $data | cut -d';' -f2))
    test "$state" = "charging"; and set color brgreen; or set color brred
  else
    echo "$cmd: Unsupported operating system" >&2
    return 1
  end
  echo -s "$cmd: " (set_color $color) "$state " (set_color normal) "at " (set_color bryellow) "$level"
end
