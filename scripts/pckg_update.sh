#!/bin/bash
PKG_TO_UPDATE=$(checkupdates | wc -l)
echo "$PKG_TO_UPDATE" > /tmp/pckg_update_count
if [[ "${PKG_TO_UPDATE}" -gt 0 ]]; then
    echo "{ \"text\": \"<span color='#F0000A'>  </span>$PKG_TO_UPDATE\",  \"tooltip\": \"Package to update: $PKG_TO_UPDATE\" }"
else
    echo "{ \"text\": \"<span color='#00FA00' font='15'> 󰏗 </span>0\", \"tooltip\": \"No update needed\" }"
fi
