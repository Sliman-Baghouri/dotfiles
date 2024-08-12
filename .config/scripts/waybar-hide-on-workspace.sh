#!/usr/bin/env bash

# Change this to the workspace number you want waybar to be hidden on
hidden_on_workspace=3

hide() {
  killall -SIGUSR1 waybar && touch /tmp/waybar_is_hidden
}

show() {
  if [ -f /tmp/waybar_is_hidden ]; then
    killall -SIGUSR1 waybar && rm /tmp/waybar_is_hidden >> /dev/null 2>&1
  fi
}

# Give waybar time to start
sleep 1

# If this script is started on the workspace waybar should be hidden on, hide waybar.
current_workspace=$(hyprctl activeworkspace | awk 'match($0, /ID ([0-9]+)/, id){print id[1]}')
[ $hidden_on_workspace -eq $current_workspace ] && hide

# Find the correct socket file
socket_path="/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

if [ -z "$socket_path" ]; then
  echo "Error: Hyprland socket not found. Is Hyprland running?"
  exit 1
fi

# Listen for events
socat -u "UNIX-CONNECT:$socket_path" STDOUT | while read -r event; do
  case $event in 
    workspace\>\>$hidden_on_workspace ) hide ;;
    workspace\>\>*                    ) show ;;
  esac
done

# Show waybar if the script is stopped
show
