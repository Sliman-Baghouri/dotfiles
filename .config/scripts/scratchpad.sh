#!/bin/bash

exec >> /tmp/scratchpad.log 2>&1
echo "Running scratchpad at $(date)"

SCRATCHPAD_NAME="scratchpad"
TARGET_MONITOR="HDMI-1"
TARGET_DESKTOP="1"  # Must exist on HDMI-1

window_id=$(xdotool search --classname "$SCRATCHPAD_NAME" | head -n 1)

if [ -z "$window_id" ]; then
    bspc monitor "$TARGET_MONITOR" -f
    bspc desktop "$TARGET_DESKTOP" -f
    sleep 0.1

    kitty --class "$SCRATCHPAD_NAME" &

    while [ -z "$window_id" ]; do
        sleep 0.1
        window_id=$(xdotool search --classname "$SCRATCHPAD_NAME" | head -n 1)
    done

    bspc node "$window_id" -t floating
    bspc node "$window_id" -g sticky=on
    bspc node "$window_id" --to-desktop "$TARGET_DESKTOP"
fi

if bspc query -N -n "$window_id.hidden" >/dev/null 2>&1; then
    bspc node "$window_id" -g hidden=off
    xdotool windowmove "$window_id" 360 100
    xdotool windowsize "$window_id" 800 600
    bspc node -f "$window_id"
else
    bspc node "$window_id" -g hidden=on
fi

