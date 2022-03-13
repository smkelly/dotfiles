set -l paths \
  $HOME/bin \
  $HOME/.cargo/bin \
  /opt/homebrew/bin \
  /opt/homebrew/sbin

if functions -q xxfish_add_path
  fish_add_path $pahs
else
  set -l --path checked
  for dir in $paths
    test -d $dir; and set -a checked (realpath $dir)
  end
  set -p PATH $checked
end

