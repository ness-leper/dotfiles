#! /bin/bash

export SWAYSOCK=$XDG_RUNTIME_DIR/sway-ipc.$UID.$(pgrep -x sway).sock

count=2
disableInternal=false
while [[ $count -lt 10 ]]; do
  external_monitor=$(swaymsg -t get_outputs | grep "DP-$count")
  if [ ! -z "${external_monitor}" ]; then
    disableInternal=true
  fi
  let count++
done

if [[ $disableInternal == true ]]; then
  swaymsg output eDP-1 disable
else
  swaymsg output eDP-1 enable
fi
