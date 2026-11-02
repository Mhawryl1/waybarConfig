#!/usr/bin/env bash

profile=$(powerprofilesctl get)

if [[ $profile == "balanced" ]]; then
    echo "{ \"text\": \"<span color='#00FA00'> 󰯯 </span>\", \"tooltip\": \" Power Profile: $profile\" }"
elif [[ $profile == "power-saver" ]]; then
    echo "{ \"text\": \"<span color='#000A99'> 󰰢 </span>\", \"tooltip\": \" Power Profile: $profile\" }"
elif [[ $profile == "performance" ]]; then
    echo "{ \"text\": \"<span color='#E00A0A'> 󰰙 </span>\", \"tooltip\": \" Power Profile: $profile\" }"
fi


