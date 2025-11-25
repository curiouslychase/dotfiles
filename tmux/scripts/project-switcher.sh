#!/bin/bash

# Get list of tmuxinator projects
projects=$(tmuxinator list | tail -n +2 | tr ' ' '\n' | grep -v '^$')

# Get current sessions
current_sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)

# Build menu with status indicators
menu=""
while IFS= read -r project; do
  if echo "$current_sessions" | grep -q "^${project}$"; then
    menu+="● $project\n"
  else
    menu+="○ $project\n"
  fi
done <<< "$projects"

# Show menu and get selection
selected=$(echo -e "$menu" | fzf \
  --prompt="Switch to project: " \
  --height=40% \
  --reverse \
  --no-info \
  --header="● = active, ○ = will create" \
  | sed 's/^[●○] //')

# Exit if cancelled
[[ -z "$selected" ]] && exit 0

# Start/switch to project using tmuxinator
tmuxinator start "$selected"
