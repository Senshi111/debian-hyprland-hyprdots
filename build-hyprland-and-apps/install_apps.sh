#!/bin/bash

# Function to install packages
install_packages() {
    sudo apt install -y "$@"
}

# Add repositories and update the system here if needed

# Install required packages
install_packages \
    pipewire \
    pipewire-alsa \
    pipewire-audio \
    pipewire-jack \
    pipewire-pulse \
    wireplumber \
    network-manager \
    network-manager-gnome \
    bluez \
    blueman \
    brightnessctl \
    qt6-wayland \
    dunst \
    rofi \
    swayidle \
    wlogout \
    grim \
    slurp \
    polkit-kde-agent-1 \
    xdg-desktop-portal-gtk \
    imagemagick \
    pavucontrol \
    pamixer \
    qt5-style-kvantum \
    qt5ct \
    kitty \
    neofetch \
    dolphin \
    vim \
    ark \
    zsh \
    exa \
    qt5-image-formats-plugins \
    qt6-base-dev \
    libpipewire-0.3-dev \
    libinih-dev \
    ffmpegthumbs \