#!/usr/bin/env bash

hide() {
  echo "Hiding waybar"
  killall -SIGUSR1 waybar && touch /tmp/waybar_is_hidden
}

show() {
  if [ -f /tmp/waybar_is_hidden ]; then
    echo "Showing waybar"
    killall -SIGUSR1 waybar && rm /tmp/waybar_is_hidden >> /dev/null 2>&1
  fi
}

is_special_workspace_active() {
  local workspace
  workspace=$(hyprctl activewindow -j | jq -r '.workspace.name')
  echo "Current workspace: $workspace"
  [[ $workspace == special:* ]]
}

# Find the correct socket file
socket_path="/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

if [ -z "$socket_path" ]; then
  echo "Error: Hyprland socket not found. Is Hyprland running?"
  exit 1
fi

echo "Using socket: $socket_path"

# Listen for events
socat -u "UNIX-CONNECT:$socket_path" STDOUT | while read -r event; do
  echo "Received event: $event"
  if is_special_workspace_active; then
    hide
  else
    show
  fi
done
