#!/bin/bash

# Clone and install nwg-look
git clone https://github.com/nwg-piotr/nwg-look.git
cd swaylock-effects
make build
sudo make install
cd ..