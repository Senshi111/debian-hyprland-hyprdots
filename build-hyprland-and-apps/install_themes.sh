#!/bin/bash

# install hyprdots files
# Clone the repository
git clone https://github.com/Senshi111/hyprland-hyprdots-files.git

# Move to the Configs directory
cd hyprland-hyprdots-files/Theme/Configs/.config/hypr || { echo "Error: Unable to navigate to the Configs directory."; exit 1; }

# Replace the specified line in the configuration file
sed -i 's|exec-once = /usr/lib/polkit-kde-authentication-agent-1 # authentication dialogue for GUI apps|exec-once = /usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1|' hyprland.conf || { echo "Error: Unable to modify the configuration file."; exit 1; }

# Move back to the original directory
cd ../../../../../ || { echo "Error: Unable to navigate back to the original directory."; exit 1; }

# Move to the Scripts directory
cd hyprland-hyprdots-files/Theme/Scripts || exit

# Run the installation script
./install.sh

# Move back to the original directory
cd ../../../ || exit

# Optional: Print a message indicating successful completion
echo "Installation completed successfully."
