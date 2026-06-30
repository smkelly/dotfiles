function fish_prompt --description 'Fast prompt without Starship'
    set -l last_status $status

    set -l normal (set_color normal)
    set -l user_color (set_color --bold yellow)
    set -l root_user_color (set_color --bold red)
    set -l host_color (set_color --bold --dim green)
    set -l sep_color (set_color brblack)
    set -l cwd_color (set_color --bold cyan)
    set -l git_color (set_color --bold purple)
    set -l dirty_color (set_color --bold yellow)
    set -l status_color (set_color --bold red)
    set -l prompt_color (set_color --bold green)

    set -l is_remote 0
    if set -q SSH_TTY; or set -q SSH_CONNECTION
        set is_remote 1
    end

    set -l login_user $LOGNAME
    if test -z "$login_user"
        set login_user $USER
    end

    set -l show_user 0
    if test -n "$USER"; and test "$USER" != "$login_user"
        set show_user 1
    end
    if test "$USER" = root
        set show_user 1
        set user_color $root_user_color
    end

    if test $is_remote -eq 1; and not set -q __fish_prompt_short_hostname
        set -g __fish_prompt_short_hostname (command hostname -s 2>/dev/null; or command hostname 2>/dev/null; or echo unknown)
    end

    if test $is_remote -eq 1
        if test $show_user -eq 1
            echo -n -s $user_color $USER $sep_color '@' $host_color '🌐 ' $__fish_prompt_short_hostname $sep_color ':' $normal
        else
            echo -n -s $host_color '🌐 ' $__fish_prompt_short_hostname $sep_color ':' $normal
        end
    else if test $show_user -eq 1
        echo -n -s $user_color $USER $sep_color ':' $normal
    end

    echo -n -s $cwd_color (prompt_pwd -d 1) $normal

    set -l git_status (command git status --porcelain=v1 --branch --ignore-submodules=dirty 2>/dev/null)
    if test (count $git_status) -gt 0
        set -l branch (string replace -r '^## ' '' -- $git_status[1])
        set branch (string replace -r '\.\.\..*$' '' -- $branch)
        if string match -q 'HEAD*' -- $branch
            set -l head (command git rev-parse --short HEAD 2>/dev/null)
            if test -n "$head"
                set branch @$head
            end
        end

        set -l dirty_marker
        if test (count $git_status) -gt 1
            set dirty_marker ' *'
        end
        echo -n -s ' ' $sep_color 'on ' $git_color ' ' $branch $dirty_color $dirty_marker $normal
    end

    if test $last_status -ne 0
        echo -n -s ' ' $status_color '[' $last_status ']' $normal
        set prompt_color $status_color
    end

    echo -n -s ' ' $prompt_color '❯ ' $normal
end
