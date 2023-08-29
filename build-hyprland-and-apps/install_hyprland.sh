#!/bin/bash

# Clone and build Hyprland
git clone --recursive https://github.com/hyprwm/Hyprland -b v0.28.0
cd Hyprland
meson build
ninja -C build
sudo ninja -C build install
cd ..
