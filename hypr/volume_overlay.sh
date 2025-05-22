#!/bin/bash

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}') # For PipeWire
# VOLUME=$(pamixer --get-volume) # For PulseAudio

FONT_NAME="Monospace 14"

WINDOW_ID=$(yad --no-buttons --title="Volume" --text="Volume: $VOLUME%" --geometry=100x50+50 --timeout=1 --on-top --fixed)

# Optional: Kill the window if it doesn't close automatically
if [ -n "$WINDOW_ID" ]; then
    sleep 1
    kill "$WINDOW_ID"
fi
