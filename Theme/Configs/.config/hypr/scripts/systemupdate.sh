#!/usr/bin/env bash

# Check for Debian release
if [ ! -f /etc/debian_version ] ; then
    exit 0
fi

# Check for updates
sudo apt update > /dev/null
official_updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)

# Calculate total available updates
total_updates=$(( official_updates ))
echo "$total_updates"

# Show tooltip
if [ "$total_updates" -eq 0 ] ; then
    echo " Packages are up to date"
else
    echo "󱓽 Official $official_updates"
fi

# Trigger upgrade
if [ "$1" == "up" ] ; then
    kitty --title systemupdate sh -c 'sudo apt upgrade'
fi


