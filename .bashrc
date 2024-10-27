
test -s ~/.alias && . ~/.alias || true

eval "$(fzf --bash)"

stty -ixon

export EDITOR='nvim'
# alias vim='vimx'
alias vault="cd ~/Documents/WorkVault/"
alias vaulth="cd ~/Documents/HomeVault/"
alias config="cd ~/Config"
alias mount="cd /mnt/Workspace"
alias ta="cd /var/home/thadryan/Documents/WorkVault/Projects/TA-2024-Fall"

alias nvimconfig="cd ~/Config/.config/nvim"

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

alias conf_depr_check="tail /mnt/Workspace/conformal-depression/_log.out"
alias conf_depr_report="rm -rf ~/Temp/ado-MAT; cp -r /mnt/Workspace/conformal-depression/build ~/Temp/conf-depr/"

alias dev="distrobox enter --root dev-fedora"

alias mntssh="sshfs f006fkc@discovery7.hpcc.dartmouth.edu:/dartfs-hpc/rc/home/c/f006fkc/Workspace/opioid-predictions/triforecast sshmnt/"

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias open='xdg-open'
alias conda='micromamba'

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

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/nix/store/kvvvw8dgkpq827i2c7x26jcp825yrx3j-micromamba-1.5.8/bin/micromamba';
export MAMBA_ROOT_PREFIX='/var/home/thadryan/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
