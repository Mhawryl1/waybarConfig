#!/usr/bin/env bash

ACTIVESERVER=$(nmcli connection show --active | awk 'NR!=1 && $3=="vpn" { print $1 }')
VPNSERVER=$(<~/.config/waybar/scripts/.last_vpn)

if [[ ${#ACTIVESERVER} > 0 ]]; then
    echo $ACTIVESERVER > ~/.config/waybar/scripts/.last_vpn
    export VPNSERVER="${ACTIVESERVER}" ## assign last connected server to environment variable for reconnect propose
    nmcli connection down id $ACTIVESERVER > /dev/null 2>&1
else
    if [[ ${#VPNSERVER} > 0 ]]; then
        nmcli connection up id $VPNSERVER > /dev/null 2>&1
    else
        all_vpn=$(nmcli connection show | awk 'NR!=1 && $3=="vpn" { print $1 }')
        vpn_list=()
        while IFS= read -r line; do
            vpn_list+=("$line")
        done <<< "$all_vpn"
        VPNSERVER="${vpn_list[1]}"
        echo $VPNSERVER > ~/.config/waybar/scripts/.last_vpn
        nmcli connection up id $VPNSERVER > /dev/null 2>&1
    fi
fi

pkill -SIGRTMIN+7 waybar
