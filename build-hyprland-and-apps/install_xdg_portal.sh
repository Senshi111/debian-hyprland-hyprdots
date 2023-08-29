#!/bin/bash


# Clone and build xdg-desktop-portal-hyprland
git clone https://github.com/hyprwm/xdg-desktop-portal-hyprland.git
cd xdg-desktop-portal-hyprland
meson build --prefix=/usr
ninja -C build
# Build hyprland-share-picker
cd hyprland-share-picker && make all && cd ..
ninja -C build install
sudo cp hyprland-share-picker/build/hyprland-share-picker /usr/bin/
cd ..