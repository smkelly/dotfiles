status is-interactive; or exit

set -l found

# Need "" on the end so $found is empty if none found
for found in nvim vim vi ""
  type -fq $found; and break
end

test $found; or exit

for x in nvim vim vi
  test $x = $found; or abbr -ag $x $found
end

set -q EDITOR; or set -gx EDITOR (type -P $found)
set -q VISUAL; or set -gx VISUAL (type -P $found)
