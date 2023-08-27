#!/bin/bash
#|---/ /+---------------------------------------------+---/ /|#
#|--/ /-| Script to install pkgs from input list      |--/ /-|#
#|-/ /--| Prasanth Rangan                             |-/ /--|#
#|/ /---+---------------------------------------------+/ /---|#

source global_fn.sh
if [ $? -ne 0 ] ; then
    echo "Error: unable to source global_fn.sh, please execute from $(dirname $(realpath $0))..."
    exit 1
fi

# Check if Git is installed and install it if not
if ! command -v git &>/dev/null; then
    echo "Installing dependency git..."
    sudo apt-get update
    sudo apt-get install -y git
fi

# Note: There's no direct equivalent of AUR in Debian, so some parts of the script will change

install_list="${1:-install_pkg.lst}"

while read pkg; do
    if dpkg -l | grep -q "^ii  ${pkg} "; then
        echo "Skipping ${pkg}..."
    elif apt-cache show ${pkg} &>/dev/null; then
        echo "Queueing ${pkg} from Debian repo..."
        pkg_deb="${pkg_deb} ${pkg}"
    else
        echo "Error: Unknown package ${pkg}..."
    fi
done < $install_list

if [ -n "$pkg_deb" ]; then
    echo "Installing $pkg_deb from Debian repo..."
    sudo apt-get update
    sudo apt-get install -y $pkg_deb
fi
