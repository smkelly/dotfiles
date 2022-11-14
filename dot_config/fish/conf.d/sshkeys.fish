if test (uname -s) = "Darwin"
  abbr -ag sshkeys "ssh-add --apple-load-keychain"
else
  abbr -ag sshkeys "ssh-add -A"
end

