test -s ~/.alias && . ~/.alias || true

eval "$(fzf --bash)"
# eval "$(zoxide init bash)"

stty -ixon

# shopt -s histappend

# https://www.baeldung.com/linux/tmux-startup-default-shell
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach-session -t default || tmux new-session -s default
# fi

export EDITOR="nvim"

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
alias mntssh="sshfs f006fkc@discovery7.hpcc.dartmouth.edu:/dartfs-hpc/rc/home/c/f006fkc/Workspace/opioid-predictions/triforecast sshmnt/"
alias vpn="sh ~/.scripts/vpn.sh"

alias triforecast="cd ~/WorkVault/Projects/triforecast/triforecast"

# Generalized sync function with a third argument
sync_project_files() {
  local workspace_base=$1       # e.g. /mnt/Workspace or /mnt/Workspace/triforecast
  local project_dir=$2          # e.g. adolescent-MAT or 01_NSDUH
  local target=$3               # 'report', 'outputs', or 'notebooks'
  local source_dir="$workspace_base/$project_dir"
  local target_base=~/Temp/$project_dir

  mkdir -p "$target_base"

  case "$target" in
    report)
      if [ -d "$source_dir/build" ]; then
        rm -rf "$target_base/report"
        cp -r "$source_dir/build" "$target_base/report"
      fi
      ;;
    outputs)
      if [ -d "$source_dir/outputs" ]; then
        rm -rf "$target_base/outputs"
        cp -r "$source_dir/outputs" "$target_base/outputs"
      fi
      ;;
    notebooks)
      mkdir -p "$target_base/notebooks"
      shopt -s nullglob
      local notebooks=("$source_dir"/*.ipynb)
      if [ ${#notebooks[@]} -gt 0 ]; then
        rm -f "$target_base/notebooks"/*.ipynb
        cp "${notebooks[@]}" "$target_base/notebooks/"
      fi
      shopt -u nullglob
      ;;
    *)
      echo "Unknown target: $target (must be: report, outputs, notebooks)"
      return 1
      ;;
  esac
}


# adolescent-MAT
alias ado_mat_sync_report='sync_project_files /mnt/Workspace adolescent-MAT report'
alias ado_mat_sync_outputs='sync_project_files /mnt/Workspace adolescent-MAT outputs'
alias ado_mat_sync_notebooks='sync_project_files /mnt/Workspace adolescent-MAT notebooks'

# ind-oud
alias ind_oud_sync_report='sync_project_files /mnt/Workspace ind-oud report'
alias ind_oud_sync_outputs='sync_project_files /mnt/Workspace ind-oud outputs'
alias ind_oud_sync_notebooks='sync_project_files /mnt/Workspace ind-oud notebooks'

# triforecast - 00_CensusAndProjections
alias projections_sync_report='sync_project_files /mnt/Workspace/triforecast 00_CensusAndProjections report'
alias projections_sync_outputs='sync_project_files /mnt/Workspace/triforecast 00_CensusAndProjections outputs'
alias projections_sync_notebooks='sync_project_files /mnt/Workspace/triforecast 00_CensusAndProjections notebooks'

# triforecast - 01_NSDUH
alias NSDUH_sync_report='sync_project_files /mnt/Workspace/triforecast 01_NSDUH report'
alias NSDUH_sync_outputs='sync_project_files /mnt/Workspace/triforecast 01_NSDUH outputs'
alias NSDUH_sync_notebooks='sync_project_files /mnt/Workspace/triforecast 01_NSDUH notebooks'

# triforecast - 02_NEMSIS
alias NEMSIS_sync_report='sync_project_files /mnt/Workspace/triforecast 02_NEMSIS report'
alias NEMSIS_sync_outputs='sync_project_files /mnt/Workspace/triforecast 02_NEMSIS outputs'
alias NEMSIS_sync_notebooks='sync_project_files /mnt/Workspace/triforecast 02_NEMSIS notebooks'

# triforecast - 03_NCHS
alias NCHS_sync_report='sync_project_files /mnt/Workspace/triforecast 03_NCHS report'
alias NCHS_sync_outputs='sync_project_files /mnt/Workspace/triforecast 03_NCHS outputs'
alias NCHS_sync_notebooks='sync_project_files /mnt/Workspace/triforecast 03_NCHS notebooks'

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
export MAMBA_ROOT_PREFIX='/home/thadryan/Micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

