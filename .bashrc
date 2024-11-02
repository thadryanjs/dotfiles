
test -s ~/.alias && . ~/.alias || true

eval "$(fzf --bash)"

stty -ixon

# https://www.baeldung.com/linux/tmux-startup-default-shell
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach-session -t default || tmux new-session -s default
# fi

export EDITOR="vim"
alias reboot="systemctl reboot"
alias vault="cd ~/Documents/WorkVault/"
alias vaulth="cd ~/Documents/HomeVault/"
alias config="cd ~/.dotfiles"
alias mount="cd /mnt/Workspace"
alias ta="cd /var/home/thadryan/Documents/WorkVault/Projects/TA-2024-Fall"

alias nvimconfig="cd ~/.dotfiles/.config/nvim"

alias discovery="sh ~/.scripts/discovery.sh"
alias polaris="sh ~/.scripts/polaris.sh"
alias andes="sh ~/.scripts/andes.sh"
alias dartfs="sh ~/.scripts/mount-dartfs.sh"
alias vpn="sh ~/.scripts/vpn.sh"

alias triforecast="cd ~/Documents/WorkVault/Projects/OpioidPredictions/triforecast"
alias check_NSDUH="tail /mnt/Workspace/triforecast/00_NSDUH/_log.out"
alias check_NEMSIS="tail /mnt/Workspace/triforecast/01_NEMSIS/_log.out"
alias check_NCHS="tail /mnt/Workspace/triforecast/02_NCHS/_log.out"

alias ado_mat_check="tail /mnt/Workspace/adolescent-MAT/_log.out"
alias ado_mat_report="rm -rf ~/Temp/ado-MAT; cp -r /mnt/Workspace/adolescent-MAT/build ~/Temp/ado-MAT/"

alias dev="distrobox enter --root dev-fedora"

alias mntssh="sshfs f006fkc@discovery7.hpcc.dartmouth.edu:/dartfs-hpc/rc/home/c/f006fkc/Workspace/opioid-predictions/triforecast sshmnt/"

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\W\[\033[00m\]$(parse_git_branch)\n~:) '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\W\[\033[00m\]$(parse_git_branch)\n~:) '
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
# if [[ "$(hostname)" == *"dev-fedora-main"* ]]; then
    PS1='📦${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\W\[\033[00m\]$(parse_git_branch)\n~:) '
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

# not currently in use
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
export MAMBA_ROOT_PREFIX='/home/thadryan/Micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
