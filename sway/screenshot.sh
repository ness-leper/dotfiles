#!/bin/bash
FILENAME="screenshot-`date +%F-%T`"
grim -g "$(slurp)" ~/Pictures/Screenshots/$FILENAME.png
echo $FILENAME
wl-copy < ~/Pictures/Screenshots/$FILENAME.png 
notify-send $FILENAME "Copied to clipboard!"
