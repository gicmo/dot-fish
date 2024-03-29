# -=[ fish main config file
# -=[ © 2019 Christian J. Kellner <christian@kellner.me>

# -=[ environment

set -x EMAIL "christian@kellner.me"
set -x EMAIL_ADDRESS "$EMAIL"

set -x LC_ALL en_GB.UTF-8
set -x LANG en_GB.UTF-8


# [ paths and PATH ]

set -x AQUARIUM ~/.config/fish
set -x CODE_HOME ~/Code

set -x GOPATH $CODE_HOME/go
set -x WORKON_HOME $CODE_HOME/envs
set -x VIRTUALFISH_HOME $CODE_HOME/envs
set -x RUST_SRC_PATH $CODE_HOME/src/rust/src

path_add ~/.local/bin
path_add ~/.cargo/bin $GOPATH/bin
path_add /usr/local/bin /usr/local/sbin/
path_add /opt/local/bin /opt/local/sbin/

# [ editors ]

if type -q nvim
    set -x EDITOR nvim
else if type -q vim
    set -x EDITOR vim
else
    set -x EDITOR vi
end

set -x CVSEDITOR $EDITOR
set -x VISUAL $EDITOR


# -=[ are we clever?

if test "$TERM" = "dumb"
    source $AQUARIUM/utils/play_dumb.fish
    exit
end

if not set -q container;
    if grep -siq "docker" /proc/1/cgroup
        set -x container docker
    else if grep -siq "lxc" /proc/1/cgroup
        set -x container lxc
    end
end

# -=[ are we an interactive session?

if status is-interactive

    # -=[ colors
    source $AQUARIUM/colors/nord.fish

    # -=[ colors
    source $AQUARIUM/aliases.fish

end
