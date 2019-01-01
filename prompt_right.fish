function fish_right_prompt -d "Write out the right prompt"

    set -l last_status $status

    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showupstream 'informative'
    set -g __fish_git_prompt_showcolorhints true

    set -g __fish_git_prompt_showuntrackedfiles
    set -g __fish_git_prompt_showdirtystate true

    set -g __fish_git_prompt_color $fish_color_autosuggestion
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_cancel
    set -g __fish_git_prompt_color_stagedstate $fish_color_host

    set -g __fish_git_prompt_char_upstream_ahead ' ↑'
    set -g __fish_git_prompt_char_upstream_behind ' ↓'
    set -g __fish_git_prompt_char_stateseparator ' |'
    set -g __fish_git_prompt_char_dirtystate ' M'
    set -g __fish_git_prompt_char_invalidstate ' I'
    set -g __fish_git_prompt_char_stagedstate ' S'
    set -g __fish_git_prompt_char_untrackedfiles ' A'
    set -g __fish_git_prompt_char_cleanstate ''

    if test $last_status -ne 0
        set_color $fish_color_error
	printf " %d ↵ " $last_status
	set_color $fish_color_normal
    end

    set_color $fish_color_normal
    echo -n (__fish_git_prompt "[%s] ")
end
