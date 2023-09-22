#!/bin/bash

# Function to add a value to a configuration file if not present
add_to_config() {
    local config_file="$1"
    local value="$2"
    
    if ! sudo grep -q "$value" "$config_file"; then
        echo "Adding $value to $config_file"
        sudo sh -c "echo '$value' >> '$config_file'"
    else
        echo "$value is already present in $config_file."
    fi
}

# Clone and build Hyprland
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland || exit

# Check if an NVIDIA GPU is present
if lspci -k | grep -A 2 -E "(VGA|3D)" | grep -iq nvidia; then
    sed 's/glFlush();/glFinish();/g' -i subprojects/wlroots/render/gles2/renderer.c

    # Add nvidia_drm.modeset=1 to GRUB_CMDLINE_LINUX_DEFAULT
    add_value="nvidia_drm.modeset=1"
    grub_config="/etc/default/grub"
    
    if [ -e "$grub_config" ]; then
        add_to_config "$grub_config" "$add_value"
        sudo update-grub
    else
        echo "GRUB configuration file ($grub_config) not found."
    fi

    # Add NVIDIA modules to initramfs configuration
    modules_to_add="nvidia nvidia_modeset nvidia_uvm nvidia_drm"
    modules_file="/etc/initramfs-tools/modules"
    
    if [ -e "$modules_file" ]; then
        add_to_config "$modules_file" "$modules_to_add"
        sudo update-initramfs -u
    else
        echo "Modules file ($modules_file) not found."
    fi
fi

# Build Hyprland using Meson and Ninja
meson build
ninja -C build
sudo ninja -C build install

# Return to the previous directory
cd ..
