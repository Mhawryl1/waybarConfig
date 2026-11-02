#!/bin/bash

layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "xremap") | .active_keymap')


echo "{ \"text\": \"$layout\" }"

# pkill -SIGRTMIN+6 waybar

