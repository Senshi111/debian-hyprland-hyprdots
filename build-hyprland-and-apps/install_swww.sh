#!/bin/bash

# Clone and build swww
git clone https://github.com/Horus645/swww.git
cd swww
source "$HOME/.cargo/env"
# Build swww
cargo build --release

# Copy binaries to /usr/bin/
sudo cp target/release/swww /usr/bin/
sudo cp target/release/swww-daemon /usr/bin/

# Copy bash completions
sudo mkdir -p /usr/share/bash-completion/completions
sudo cp completions/swww.bash /usr/share/bash-completion/completions/swww

# Uncomment this section if needed
# Copy fish completions
#sudo mkdir -p /usr/share/fish/vendor_completions.d/
#sudo cp completions/swww.fish /usr/share/fish/vendor_completions.d/swww.fish

# Copy zsh completions
sudo mkdir -p /usr/share/zsh/site-functions
sudo cp completions/_swww /usr/share/zsh/site-functions/_swww

# Return to the previous directory
cd ..
