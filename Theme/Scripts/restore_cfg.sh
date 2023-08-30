#!/bin/bash
#|---/ /+------------------------------------+---/ /|#
#|--/ /-| Script to restore personal configs |--/ /-|#
#|-/ /--| Prasanth Rangan                    |-/ /--|#
#|/ /---+------------------------------------+/ /---|#

source global_fn.sh
if [ $? -ne 0 ]; then
    echo "Error: unable to source global_fn.sh, please execute from $(dirname $(realpath $0))..."
    exit 1
fi

CfgDir=$(echo "$CloneDir/Configs")
BkpDir="${HOME}/.config/$(date +'%Y%m%d_%H%M%S')"

if [ -d "$BkpDir" ]; then
    echo "ERROR: $BkpDir exists!"
    exit 1
else
    mkdir -p "$BkpDir"
fi

while IFS='|' read -r pth cfg pkg; do

    pth=$(eval echo "$pth")

    while IFS= read -r pkg_chk; do
        if ! dpkg -l | grep -q "^ii  ${pkg_chk} "; then
            echo "skipping ${cfg}..."
            continue 2
        fi
    done < <(echo "${pkg}" | xargs -n 1)

    echo "${cfg}" | xargs -n 1 | while read -r cfg_chk; do
        tgt=$(echo "$pth" | sed "s+^${HOME}++g")

        if [ -d "$pth/$cfg_chk" ] || [ -f "$pth/$cfg_chk" ]; then
            if [ ! -d "$BkpDir$tgt" ]; then
                mkdir -p "$BkpDir$tgt"
            fi

            mv "$pth/$cfg_chk" "$BkpDir$tgt"
            echo "config backed up $pth/$cfg_chk --> $BkpDir$tgt..."
        fi

        if [ ! -d "$pth" ]; then
            mkdir -p "$pth"
        fi

        cp -r "$CfgDir$tgt/$cfg_chk" "$pth"
        echo "config restored ${pth} <-- $CfgDir$tgt/$cfg_chk..."
    done

done < restore_cfg.lst

touch "${HOME}/.config/hypr/monitors.conf"
touch "${HOME}/.config/hypr/userprefs.conf"

# nvidia_detect function implementation may vary on Debian, so adjust accordingly
if nvidia_detect; then
    cp "${CfgDir}/.config/hypr/nvidia.conf" "${HOME}/.config/hypr/nvidia.conf"
    echo -e 'source = ~/.config/hypr/nvidia.conf\n' >> "${HOME}/.config/hypr/hyprland.conf"
fi

./restore_lnk.sh
./create_cache.sh

