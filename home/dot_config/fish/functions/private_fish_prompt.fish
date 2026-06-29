function fish_prompt --description 'Fast prompt without Starship'
    set -l last_status $status

    set -l normal (set_color normal)
    set -l user_color (set_color yellow)
    set -l host_color (set_color magenta)
    set -l sep_color (set_color brblack)
    set -l cwd_color (set_color cyan)
    set -l git_color (set_color green)
    set -l status_color (set_color red)
    set -l prompt_color (set_color green)

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

    set -l branch (command git symbolic-ref --quiet --short HEAD 2>/dev/null)
    if test -z "$branch"
        set branch (command git rev-parse --short HEAD 2>/dev/null)
    end
    if test -n "$branch"
        echo -n -s ' ' $sep_color 'on ' $git_color ' ' $branch $normal
    end

    if test $last_status -ne 0
        echo -n -s ' ' $status_color '[' $last_status ']' $normal
    end

    echo -n -s ' ' $prompt_color '❯ ' $normal
end
