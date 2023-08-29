#!/bin/bash

# Clone and build wl-clipboard
git clone https://github.com/bugaevc/wl-clipboard.git
cd wl-clipboard
# Build and install
meson setup build
cd build
ninja
sudo meson install
cd ..
