#!/bin/bash

# The WM_CLASS we want to target (first value)
DEVTOOLS_CLASS="Devtools"

# Check if the devtools window exists
if ! xdotool search --classname "$DEVTOOLS_CLASS" >/dev/null 2>&1; then
    # If it doesn't exist, simulate F12 in Firefox to open it
    # (Assuming Firefox is running and F12 toggles devtools open)
    xdotool search --onlyvisible --class "firefox" windowactivate --sync key F12
    # Allow a short delay for the devtools window to appear
    sleep 0.5
fi

# Retrieve the window ID of the devtools window (if more than one, take the first)
window_id=$(xdotool search --classname "$DEVTOOLS_CLASS" | head -n1)

# If for some reason we still didn't find it, exit
if [ -z "$window_id" ]; then
    echo "Firefox devtools window not found."
    exit 1
fi

# Check the hidden state of the window via bspwm
# Note: This assumes bspwm manages the window normally.
window_state=$(bspc query -N -n "${window_id}.hidden")

if [ -n "$window_state" ]; then
    # If the window is hidden, unhide it and bring it to focus
    bspc node "$window_id" -g hidden=off
    bspc node -f "$window_id"
else
    # If the window is visible, hide it
    bspc node "$window_id" -g hidden=on
fi

