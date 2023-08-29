#!/bin/bash

# Clone and build Hyprland
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
meson build
ninja -C build
sudo ninja -C build install
cd ..
