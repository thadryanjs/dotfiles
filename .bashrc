# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true
source ~/.dotfiles/bin/bashmarks.sh
source /usr/share/fzf/shell/key-bindings.bash

# don't do this unless I'm in a dev container
# if [[ "$(hostname)" == "hostname" ]]; then
    # Set up fzf key bindings and fuzzy completion
#     eval "$(fzf --bash)"
# fi

stty -ixon

alias discovery="sh /home/thadryan/Documents/WorkVault/Resources/Scripts/_discovery.sh"
alias polaris="sh /home/thadryan/Documents/WorkVault/Resources/Scripts/_polaris.sh"
alias andes="sh /home/thadryan/Documents/WorkVault/Resources/Scripts/_andes.sh"

alias dartfs="sh /home/thadryan/Documents/WorkVault/Resources/Scripts/_mount-dartfs.sh"
alias vpn="sh /home/thadryan/Documents/WorkVault/Resources/Scripts/_vpn.sh"

alias dev="distrobox enter --root fedora-root -- bash "

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias open='xdg-open'

# add quart to path
export PATH=$PATH:/opt/quarto-1.4.554-linux-rhel7-amd64/quarto-1.4.554/bin
# need to make this conditional on hostname
# alias nvim="/usr/bin/distrobox-enter  --root -n dev-fedora-main -- bash && nvim"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \[\e[32m\]\W \[\e[91m\]\$(parse_git_branch)\[\e[00m\]\n~:) "

if (env | grep -Fq 'DISTROBOX'); then
# if [[ "$(hostname)" == *"dev-fedora-main"* ]]; then
    export PS1="📦\u@\h \[\e[32m\]\W \[\e[91m\]\$(parse_git_branch)\[\e[00m\]\n~:) "
fi


# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --preview 'tree -C {}'"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/thadryan/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/thadryan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/thadryan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/thadryan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/thadryan/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/thadryan/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
export PATH=$PATH:/home/thadryan/.pixi/bin
