test -s ~/.alias && . ~/.alias || true

eval "$(fzf --bash)"
# eval "$(zoxide init bash)"

stty -ixon

# shopt -s histappend

# Check if not running interactively
[[ $- != *i* ]] && return

export TMUX_CONF=~/.config/tmux/tmux.conf
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


export EDITOR="nvim"
export LLM_KEY=NONE

# hack for now
if [ -n "$(ls ~/Downloads/MarkDownload/)" ] && \
   [ -d ~/WorkVault/Resources/WebClips ]; then
  mv ~/Downloads/MarkDownload/* ~/WorkVault/Resources/WebClips
fi

alias reboot="systemctl reboot"
alias shutdown="sudo shutdown now"
alias update="sh .scripts/debian-nix-update.sh"

alias nvimconfig="cd ~/.dotfiles/.config/nvim"
alias dotfiles="cd ~/.dotfiles"
alias config="cd ~/.dotfiles/.config"
# alias dec="sudo decman --source ~/.config/decman/decman.py"
alias dec="sudo decman"

alias mount="cd /mnt/Workspace"
alias vault="cd ~/WorkVault/"
alias vaulthome="cd ~/HomeVault/"
alias projects="cd ~/WorkVault/Projects/"
alias system="cd ~/WorkVault/Areas/Tech/System"
alias tech="cd ~/WorkVault/Areas/Tech/"
alias ta="cd ~/WorkVault/Projects/TA-2025-Winter"

alias discovery="sh ~/.scripts/discovery.sh"
alias polaris="sh ~/.scripts/polaris.sh"
alias andes="sh ~/.scripts/andes.sh"
alias dartfs="sh ~/.scripts/mount-dartfs.sh"
alias vpn="sh ~/.scripts/vpn.sh"

alias triforecast="cd ~/WorkVault/Projects/triforecast/triforecast"

alias ado_mat_sync="sh ~/.scripts/ado-mat-sync.sh"
alias oud_predictors_ml_sync="sh ~/.scripts/oud-predictors-ml.sh"

alias mntssh="sshfs f006fkc@discovery7.hpcc.dartmouth.edu:/dartfs-hpc/rc/home/c/f006fkc/Workspace/opioid-predictions/triforecast sshmnt/"

alias lock="swaylock --ignore-empty-password --image /home/thadryan/HomeVault/Areas/Art/Backgrounds/bioshock2.jpg"



alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
# the Chuck command
alias lss='ls -ltrh'
alias open='xdg-open'

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
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\W\[\033[00m\]$(parse_git_branch)\n~:) '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\W\[\033[00m\]$(parse_git_branch)\n~:) '
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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/thadryan/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/thadryan/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

export PATH="/home/thadryan/.pixi/bin:$PATH"
# export PATH="/home/.local/share/tresorit:$PATH"

export PATH="$HOME/.local/share/tresorit:$PATH"

# export ATUIN_NOBIND=1
# eval "$(atuin init bash)"
eval "$(atuin init bash --disable-up-arrow)"
# bind '"\C-a": "atuin history list --cmd-only | sort | uniq | fzf\n"'
