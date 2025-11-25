#!/bin/bash

# Get current session to prevent killing it accidentally
current_session=$(tmux display-message -p '#S')

# Get all sessions except current
sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | grep -v "^${current_session}$")

# Build menu with sessions + kill all option
menu=""
while IFS= read -r session; do
  menu+="$session\n"
done <<< "$sessions"
menu+="──────────────\n"
menu+="⚠ KILL ALL OTHER SESSIONS"

# Show menu and get selection
selected=$(echo -e "$menu" | fzf \
  --prompt="Kill session: " \
  --height=40% \
  --reverse \
  --no-info \
  --header="Select session to kill (current: $current_session)")

# Exit if cancelled
[[ -z "$selected" ]] && exit 0

# Handle kill all
if [[ "$selected" == "⚠ KILL ALL OTHER SESSIONS" ]]; then
  # Kill all sessions except current
  while IFS= read -r session; do
    tmux kill-session -t "$session"
  done <<< "$sessions"
  exit 0
fi

# Kill single session
tmux kill-session -t "$selected"
