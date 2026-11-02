#!/usr/bin/env bash

pkgucount=$(cat /tmp/pckg_update_count | tr -d '\n')


if [[ $pkgucount -gt 0 ]]; then
    ICONPATH=$(echo ~/.config/waybar/img)
    FAILEDICON=$(echo ~/.config/waybar/img/message-error.svg)

    pkexec pacman -Syu --noconfirm && notify-send -i "${ICONPATH}/message-success.svg" -u normal  "Update success" || notify-send -i -i "${ICONPATH}/message-error.sv" -u critical "Update failed"
    pkill -SIGRTMIN+8 waybar
else
    notify-send  -u low -i ~/.config/waybar/img/message-circle.svg "No updates available"
fi


