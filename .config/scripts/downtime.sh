#!/bin/bash

install_date=$(stat -c %W /)
current_date=$(date +%s)
seconds_diff=$((current_date - install_date))

days=$((seconds_diff / 86400))
months=$((days / 30))  # Approximation
remaining_days=$((days % 30))

echo "You've been using this machine for:"
echo "$months months and $remaining_days days"
echo "(Total: $days days)"
