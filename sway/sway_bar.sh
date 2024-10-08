#! /bin/bash
# Change this according to your device
################
# Variables
################

# Keyboard input name
# keyboard_input_name="1:1:AT_Translated_Set_2_keyboard"

# Date and time
date_and_week=$(date "+%Y/%m/%d (w%-V)")
current_time=$(date "+%H:%M")

#############
# Commands
#############

# Battery or charger
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

vol=$(pamixer --get-volume)
audio_is_muted=$(pamixer --get-volume-human)

if [ $battery_status = "discharging" ];
then
    battery_pluggedin='⚠'
else
    battery_pluggedin='⚡'
fi

if [ $audio_is_muted = "muted" ]
then
    audio_active='🔇'
else
    audio_active='🔊'
fi

# echo "$network_active $interface_easyname ($ping ms) | 🏋 $loadavg_5min | $audio_active $audio_volume% | $battery_pluggedin $battery_charge | $date_and_week 🕘 $current_time"
echo "$audio_active $vol% | $battery_pluggedin $battery_charge | $date_and_week 🕘 $current_time"
