#!/bin/bash

# Check if pavucontrol is running
if pgrep -x "pavucontrol" > /dev/null; then
 hyprctl dispatch togglespecialworkspace 
else
    pavucontrol &
    hyprctl dispatch togglespecialworkspace 
fi



