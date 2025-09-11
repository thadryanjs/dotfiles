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

suffix="${1-}"

if [[ -n "$suffix" && ! "$suffix" =~ ^[0-9]+$ ]]; then
  echo "Error: argument must be a positive number if provided"
  exit 1
fi

base="dev"
session_name="$base$suffix"
window_name="code"

if tmux has-session -t "$session_name" 2>/dev/null; then
  attach_or_switch "$session_name"
  exit 0
fi

# Create session with first window named development
tmux new-session -d -s "$session_name" -n "$window_name" "${SHELL:-/bin/bash}"

# Split first window vertically and resize right pane
tmux split-window -h -t "$session_name:$window_name"
tmux resize-pane -t "$session_name:$window_name" -R 35
tmux select-pane -t "$session_name:$window_name" -L

# Create a second window (like pressing prefix + c)
tmux new-window -t "$session_name" -n "terminal"

# Select the first window before attaching
tmux select-window -t "$session_name:$window_name"

attach_or_switch "$session_name"
