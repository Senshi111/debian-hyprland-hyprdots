#!/bin/bash

# install hyprdots files
# Clone the repository
git clone https://github.com/Senshi111/hyprland-hyprdots-files.git

# Move to the Scripts directory
cd hyprland-hyprdots-files/Theme/Scripts || exit

# Run the installation script
./install.sh

# Move back to the original directory
cd ../../../ || exit

# Optional: Print a message indicating successful completion
echo "Installation completed successfully."
