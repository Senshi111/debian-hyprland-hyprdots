#!/bin/bash

# Clone and install nwg-look
git clone https://github.com/nwg-piotr/nwg-look.git
cd nwg-look
make build
sudo make install
cd ..