status is-interactive; or exit
test (uname -s) = "Linux"; or exit

begin
  function ip --wraps ip --description 'Alias for ip to set --color=auto'
    command ip --color=auto $argv
  end
end

