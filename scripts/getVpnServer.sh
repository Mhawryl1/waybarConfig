#!/bin/bash

VPN=$(nmcli connection show --active | awk 'NR!=1 && $3=="vpn" { print $1 }')
LASTVPN=$(<~/.config/waybar/scripts/.last_vpn)
COUNTRY=$(echo "$VPN" | awk '{ gsub(/\.\w+/, "", $1); gsub(/[0-9]+/, "", $1);  print $1}')
CITY=$(<~/.config/waybar/scripts/.city)

if [[ ${#VPN} == 0 && ${#CITY} != 0 ]]; then
    echo "" > ~/.config/waybar/scripts/.city
elif [[ ${#VPN} -gt 0 && ${#CITY} == 0 ]]; then
    CITY=$(curl -s ipinfo.io | jq -r '.city')
    echo "$CITY" > ~/.config/waybar/scripts/.city
fi

if [[ "${#VPN}" -gt 0 && "$LASTVPN" != "$VPN" ]]; then
    echo "$VPN" > ~/.config/waybar/scripts/.last_vpn
    CITY=$(curl -s ipinfo.io | jq -r '.city')
    echo "$CITY" > ~/.config/waybar/scripts/.city
fi

if [[ "${#COUNTRY}" -gt 0 ]]; then
    uppercase=$(echo "$COUNTRY" | tr '[:lower:]' '[:upper:]')
    uppercase="${uppercase//$'\n'/ }" #remove newline from strign
    echo "{ \"text\": \"<span color='#00FA00'> 󱘖 </span>vpn: $uppercase\", \"tooltip\": \" $CITY\" }"
else
    echo "{ \"text\": \"<span color='#F0000A'> 󱘖 </span>vpn: off\", \"tooltip\": \"VPN not connected\" }"
fi


