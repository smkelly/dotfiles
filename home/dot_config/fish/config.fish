set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"
set -gx LC_TIME "C"

set -gx TZ "America/New_York"

set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -f $__fish_config_dir/config.local.fish
    source ~/.config/fish/config.local.fish
end

