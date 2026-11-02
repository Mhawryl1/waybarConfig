#!/usr/bin/env bash

profile=$(powerprofilesctl get)

if [[ $profile == "balanced" ]]; then
    powerprofilesctl set performance
elif [[ $profile == "performance" ]]; then
    powerprofilesctl set power-saver
elif [[ $profile == "power-saver" ]]; then
    powerprofilesctl set balanced
fi

pkill -SIGRTMIN+9 waybar
