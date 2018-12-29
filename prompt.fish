function fish_prompt

    set -l color_cwd $fish_color_cwd
    set -l color_lambda 949494
    set -l color_suffix $fish_color_normal
    set -l color_user $fish_color_user

    set -l print_userhost

    if set -q UNDER_JHBUILD
	set color_suffix $fish_pager_color_progress
    end

    switch "$USER"
        case root toor
	    set -l color_root $fish_color_error
	    set color_suffix $color_root
	    set color_user $color_root
	    set print_userhost true
    end

    if set -q SSH_CONNECTION;
	set print_userhost true
    end

    # now actually print the prompt

    if test -n "$print_userhost"
	set_color $color_user
	echo -n (whoami)
	set_color $fish_color_normal
	echo -n @
	set_color $fish_color_host
	echo -n (hostname)
	set_color $fish_color_normal
	echo -n " "
    else
	set_color $color_lambda
	echo -n 'λ '
	set_color $fish_color_normal
    end

    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color $color_suffix
    echo -n ' → '
end
