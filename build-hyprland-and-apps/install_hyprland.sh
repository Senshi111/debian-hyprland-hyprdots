#!/bin/bash

# Clone and build Hyprland
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland || exit

# Check if an NVIDIA GPU is present
if lspci -k | grep -A 2 -E "(VGA|3D)" | grep -iq nvidia; then
    sed 's/glFlush();/glFinish();/g' -i subprojects/wlroots/render/gles2/renderer.c
fi

# Build Hyprland using Meson and Ninja
meson build
ninja -C build
sudo ninja -C build install

# Return to the previous directory
cd ..
