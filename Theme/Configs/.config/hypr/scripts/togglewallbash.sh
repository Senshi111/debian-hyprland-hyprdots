#!/bin/bash

# Set variables
scr_dir=$(dirname "$(realpath "$0")")
dco_dir="$HOME/.config/hypr/wallbash"
tgt_scr="$scr_dir/globalcontrol.sh"
source "$tgt_scr"

# Toggle EnableWallDcol variable
if [ "$EnableWallDcol" -eq 1 ]; then
    sed -i "/^EnableWallDcol/c\EnableWallDcol=0" "$tgt_scr"
    message="Wallbash disabled..."
else
    sed -i "/^EnableWallDcol/c\EnableWallDcol=1" "$tgt_scr"
    message="Wallbash enabled..."
fi

# Send notification
dunstify "$ncolor" "theme" -a " $message" -i "~/.config/dunst/icons/hyprdots.png" -r 91190 -t 2200

# Reset the colors
grep -m 1 '.' "$dco_dir"/*.dcol | cut -d '|' -f 2 | while read -r wallbash; do
    "$scr_dir/$wallbash"
done
