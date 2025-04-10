#!/bin/bash

# Check if system-config-printer is already running
if ! pgrep -x "system-config-printer" > /dev/null; then
    # If not running, launch it
    system-config-printer &
else
    echo "system-config-printer is already running."
fi
