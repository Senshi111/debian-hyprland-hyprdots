#!/bin/bash


# Clone and install Swaylock-effects
git clone https://github.com/mortie/swaylock-effects.git
cd swaylock-effects
meson build
ninja -C build
sudo ninja -C build install
cd ..