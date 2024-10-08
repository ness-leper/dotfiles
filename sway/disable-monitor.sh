#! /bin/bash

export SWAYSOCK=$XDG_RUNTIME_DIR/sway-ipc.$UID.$(pgrep -x sway).sock


external_monitor=$(swaymsg -t get_outputs | grep DP-5)

if [ ! -z "${external_monitor}" ]; then
  swaymsg output eDP-1 disable
fi
