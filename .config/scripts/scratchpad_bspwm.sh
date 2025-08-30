#!/bin/bash

# Get the window ID of the kitty terminal (replace 'kitty' with your terminal's class name if different)
window_id=$(xdotool search --class "kitty" | head -n 1)

if [ -z "$window_id" ]; then
    # If Kitty is not running, start it with the desired geometry
    kitty --class=scratchpad --title="scratchpad" &
else
    # If Kitty is running, toggle visibility
    current_state=$(xdotool getwindowstate $window_id)

    if [[ "$current_state" == *"Withdrawn"* ]]; then
        xdotool windowmap $window_id
    else
        xdotool windowminimize $window_id
    fi
fi

