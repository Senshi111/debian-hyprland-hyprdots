#!/bin/bash

# Set variables
script_dir=$(dirname "$(realpath "$0")")
source "$script_dir/globalcontrol.sh"
dco_dir="$HOME/.config/hypr/wallbash"

input_wall="$1"
cache_img=$(basename "$input_wall")

if [ -z "$input_wall" ] || [ ! -f "$input_wall" ]; then
    echo "Error: Input wallpaper not found!"
    exit 1
fi

# Extract dcols
if [ ! -f "${cacheDir}/${gtkTheme}/${cache_img}.dcol" ]; then
    magick "$input_wall" -colors 4 -define histogram:unique-colors=true -format "%c" histogram:info: > "${cacheDir}/${gtkTheme}/${cache_img}.dcol"
fi

dcol=( $(awk '{print substr($3,1,7)}' "${cacheDir}/${gtkTheme}/${cache_img}.dcol" | sort) )

# Check if directories exist
if [ ! -d "$dco_dir" ]; then
    echo "Error: $dco_dir does not exist!"
    exit 1
fi

# Loop through templates
find "$dco_dir" -name "*.dcol" | while read -r tplt; do
    dcolct=$(head -1 "$tplt" | cut -d '|' -f 1)
    appexe=$(head -1 "$tplt" | cut -d '|' -f 2)
    target=$(head -1 "$tplt" | cut -d '|' -f 3)

    sed '1d' "$tplt" > "$HOME/$target"
    for ((i = 0; i < dcolct; i++)); do
        if [ -z "${dcol[i]}" ]; then
            dcol[i]="${dcol[i-1]}"
        fi
        sed -i "s/<dcol_${i}>/${dcol[i]}/g" "$HOME/$target"
    done

    "$script_dir/$appexe"
done

