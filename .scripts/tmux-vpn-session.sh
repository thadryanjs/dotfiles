#!/usr/bin/env bash
set -euo pipefail

in_tmux() { [[ -n "${TMUX-}" ]]; }

attach_or_switch() {
  local target="$1"
  if in_tmux; then
    tmux switch-client -t "$target"
  else
    tmux attach-session -t "$target"
  fi
}

s="vpn"

if tmux has-session -t "$s" 2>/dev/null; then
  attach_or_switch "$s"
  exit 0
fi

# Create single-pane session (no split)
tmux new-session -d -s "$s" -n "vpn" "${SHELL:-/bin/bash}"

attach_or_switch "$s"
