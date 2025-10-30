status is-interactive; or exit

type -fq hub; and begin
  function git --wraps hub --description 'Alias for hub, which wraps git to provide extra functionality with GitHub.'
    hub $argv
  end
end

abbr -ag ga "git add"
abbr -ag gclone "git clone"
abbr -ag gc "git commit"
abbr -ag gcm "git commit -m"
abbr -ag gd "git diff"
abbr -ag gl "git pull"
abbr -ag gmv "git mv"
abbr -ag gp "git push"
abbr -ag grm "git rm"
abbr -ag gs "git status --short"
