test -s ~/.alias && . ~/.alias || true

stty -ixon

export EDITOR="nvim"
export LLM_KEY=NONE

alias reboot="systemctl reboot"
alias shutdown="sudo shutdown now"

alias nvimconfig="cd ~/.dotfiles/.config/nvim"
alias dotfiles="cd ~/.dotfiles"
alias config="cd ~/.dotfiles/.config"

# alias matrix="kitty --config ~/.config/kitty/unimatrix.conf unimatrix"

alias mount="cd /mnt/Workspace"
alias vault="cd ~/WorkVault/"
alias vaulthome="cd ~/HomeVault/"
alias projects="cd ~/WorkVault/Projects/"

alias discovery="sh ~/.scripts/discovery.sh"
alias polaris="sh ~/.scripts/polaris.sh"
alias andes="sh ~/.scripts/andes.sh"
alias dartfs="sh ~/.scripts/mount-dartfs.sh"
alias vpn="sh ~/.scripts/vpn.sh"

alias mntssh="sshfs f006fkc@discovery7.hpcc.dartmouth.edu:/dartfs-hpc/rc/home/c/f006fkc/Workspace/opioid-predictions/triforecast sshmnt/"

# alias lock="swaylock --ignore-empty-password --image /home/thadryan/HomeVault/Areas/Art/Backgrounds/bioshock2.jpg"

alias tmi="tmuxinator"
alias tmuxvpn="sh ~/.scripts/tmux-vpn-session.sh"

alias focusmode="sh ~/.scripts/focus-mode.sh"

alias queue="python ~/.scripts/overqueue.py ."

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
# the Chuck command
alias lss='ls -ltrh'
alias open='xdg-open'

# export TMUX_CONF=~/.config/tmux/tmux.conf
# check for tmux sessions, optionally join
if [[ -z "$TMUX" ]]; then
    # List existing tmux sessions
    sessions=$(tmux list-sessions 2>/dev/null)

    if [[ -n "$sessions" ]]; then
        # Display existing sessions and prompt for selection
        echo "Existing tmux sessions found:"
        echo "$sessions"
        echo "Enter the name of the session you want to join (or 'x' for none):"

        # Read user input
        read -r session_name

        if [[ "$session_name" == "x" ]]; then
            # Create a new session if 'x' is chosen
            tmux new-session
        elif tmux has-session -t "$session_name" 2>/dev/null; then
            # Attach to the specified session if it exists
            tmux attach-session -t "$session_name"
        else
            echo "Session '$session_name' does not exist. Creating a new session."
            tmux new-session
        fi
    else
        # No existing sessions, create a new one
        tmux new-session
    fi
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\w\[\033[00m\]$(parse_git_branch)\n~:) '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\w\[\033[00m\]$(parse_git_branch)\n~:) '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if (env | grep -Fq 'DISTROBOX'); then
    PS1='📦\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\W\[\033[00m\]$(parse_git_branch)\n~:) '
fi




function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PATH="/home/thadryan/.pixi/bin:$PATH"
export PATH="$HOME/.local/share/tresorit:$PATH"

## atuin
# if you make a typo, you can't scroll up and fix it so it's not a 'command'
# optional: https://docs.atuin.sh/configuration/config/#store_failed
export ATUIN_NOBIND="true"
# may need a command as arch doesn't create this file I don't think
# https://github.com/atuinsh/atuin/issues/380
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash --disable-up-arrow)"


## fzf
# to see commands
# nvim /usr/share/fzf/key-bindings.bash
# apparently you can't disable the ctrl R one? (overwritten later)
FZF_CTRL_T_COMMAND= FZF_ALT_C_COMMAND= eval "$(fzf --bash)"

# defaults
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# color scheme
# https://vitormv.github.io/fzf-themes/
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=pointer:#00d692,info:#8642c9
    --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
    --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

# custom file search
fzf_files() {
    fzf \
    --tmux \
    --preview 'bat -n --color=always {}' \
    --bind 'ctrl-/:change-preview-window(down|hidden|)'
}
bind -x '"\C-f": fzf_files'

# history search
# if you end up liking this interface better you can set
# atuin history list --cmd-only | uniq | fzf
# to get atuin memory into the fzf interface
fzf_history() {
    history | fzf \
    --tmux \
    --preview 'echo {}' \
    --preview-window up:3:hidden:wrap \
    --bind 'ctrl-/:toggle-preview' \
    --bind 'enter:execute-silent(echo -n {2..} | pbcopy | bash)+abort'
}

bind -x '"\C-h": __fzf_history__'

# custom tree search
fzf_tree() {
    fzf --tmux --preview 'tree -C {}'
}
bind -x '"\C-t": fzf_tree'

# custom ripgrep search (this fails on empty dir or only dotfiles)
fzf_ripgrep() {
: | rg_prefix='rg --column --line-number --no-heading --color=always --smart-case' \
    fzf \
        --tmux \
        --bind 'start:reload:$rg_prefix ""' \
        --bind 'change:reload:$rg_prefix {q} || true' \
        --bind 'enter:become(vim {1} +{2})' \
        --ansi --disabled \
        --height=50% --layout=reverse
}

# bind that to c-g
bind -x '"\C-g": fzf_ripgrep'

bind '"\C-r": reverse-search-history'

function atuin_search_and_edit() {
  local selected_command
  selected_command=$(atuin history list --cmd-only | awk '!seen[$0]++' | fzf)
  if [ -n "$selected_command" ]; then
    READLINE_LINE=$selected_command
    READLINE_POINT=${#READLINE_LINE}
  fi
}

bind -x '"\C-a": atuin_search_and_edit'

## zoxide
# eval "$(zoxide init bash)"

## flatpaks
alias manage-flatpaks="python /var/home/thadryan/.dotfiles/.config/misc/manage-flatpaks.py"
export PATH="/var/home/thadryan/.pixi/bin:$PATH"

## move webclips to vault (markdownload can't do outside standard Downloads folder due to browser security policies)
# hack for now
if [ -n "$(ls ~/Downloads/MarkDownload/)" ] && \
   [ -d ~/WorkVault/Resources/WebClips ]; then
  mv ~/Downloads/MarkDownload/* ~/WorkVault/Resources/WebClips
fi
