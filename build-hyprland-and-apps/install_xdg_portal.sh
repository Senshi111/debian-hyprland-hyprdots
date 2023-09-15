#!/bin/bash


# Clone and build xdg-desktop-portal-hyprland
git clone https://github.com/hyprwm/xdg-desktop-portal-hyprland.git
cd xdg-desktop-portal-hyprland
cd subprojects
git clone https://github.com/hyprwm/hyprland-protocols.git
git clone https://github.com/Kistler-Group/sdbus-cpp.git
cd ..
make all
sudo make install
cd ..