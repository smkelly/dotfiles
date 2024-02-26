function fish_title
  set -l cmd
  set -l remote

  set -q argv[1]
    and set cmd $argv[1]
    or set cmd (status current-command)
  if test "$cmd" = "fish"
    set cmd (prompt_pwd)
  end


    if test "$SSH_CONNECTION"
      set remote $USER@(string replace -r "\..*" "" $hostname)
      set remote "($remote)"
    end

    echo -n $cmd $remote
end
