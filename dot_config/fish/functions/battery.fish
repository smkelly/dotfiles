function battery --description 'Show system battery status'
  set -l data
  set -l level
  set -l state

  if test (uname) = "Darwin"
    set data (pmset -g batt | egrep -o "([0-9]+\%).*")
    set level (echo $data | cut -d';' -f1)
    set state (string trim (echo $data | cut -d';' -f2))
  else
    echo "Unsupported operating system"
    return 1
  end
  echo "Battery: $state at $level"
end
