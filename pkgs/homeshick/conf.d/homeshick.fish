#!/usr/bin/env fish

set -l homeshick_root ~/.homesick/repos/homeshick

if test -e $homeshick_root
    source $homeshick_root/homeshick.fish
    source $homeshick_root/completions/homeshick.fish
end

