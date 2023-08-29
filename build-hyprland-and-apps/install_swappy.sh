#!/bin/bash

# Clone and build swappy
git clone https://github.com/jtheoof/swappy.git
cd swappy
meson setup build
ninja -C build
ninja -C build install
cd ..
