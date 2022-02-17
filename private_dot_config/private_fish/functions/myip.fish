function myip
  argparse --name="myip" "6" -- $argv
  or return

  if test $_flag_6
    set proto "-6"
  else
    set proto "-4"
  end

  dig $proto @ns1.google.com TXT o-o.myaddr.l.google.com +short |tr -d \"
end
