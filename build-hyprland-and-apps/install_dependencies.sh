#!/bin/bash

# Function to install packages
install_packages() {
    sudo apt-get install -y "$@"
}

# Add repositories and update system here if needed

# Install required packages
install_packages \
    build-essential \
    git \
    ninja-build \
    meson \
    libcairo2-dev \
    libpango1.0-dev \
    jq \
    cmake \
    wayland-protocols \
    libwayland-dev \
    libdrm-dev \
    libxkbcommon-dev \
    libgl1-mesa-dev \
    libgbm-dev \
    libudev-dev \
    libseat-dev \
    libdisplay-info-dev \
    hwdata \
    libliftoff-dev \
    libinput-dev \
    libxcb-dri3-dev \
    libxcb-present-dev \
    libxcb-render-util0-dev \
    libxcb-xinput-dev \
    xwayland \
    libxcb-composite0-dev \
    libxcb-ewmh-dev \
    libxcb-icccm4-dev \
    libxcb-res0-dev \
    cmake-extras \
    gettext \
    gir1.2-graphene-1.0 \
    glslang-tools \
    gobject-introspection \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libdeflate-dev \
    libegl1-mesa-dev \
    libgdk-pixbuf-2.0-dev \
    libgdk-pixbuf2.0-bin \
    libgirepository1.0-dev \
    libgraphene-1.0-0 \
    libgraphene-1.0-dev \
    libgulkan-0.15-0 \
    libgulkan-dev \
    libjbig-dev \
    libjpeg-dev \
    libjpeg62-turbo-dev \
    liblerc-dev \
    liblzma-dev \
    libswresample-dev \
    libtiff-dev \
    libtiffxx6 \
    libvkfft-dev \
    libvulkan-dev \
    libvulkan-volk-dev \
    libwebp-dev \
    libxcb-xkb-dev \
    libxkbcommon-x11-dev \
    libxkbregistry-dev \
    libxml2-dev \
    libxxhash-dev \
    python3-mako \
    python3-markdown \
    python3-markupsafe \
    python3-yaml \
    seatd \
    spirv-tools \
    vulkan-validationlayers \
    vulkan-validationlayers-dev \
    xdg-desktop-portal \
    xdg-desktop-portal-wlr \
    libsystemd-dev \
    qt6-base-dev \
    build-essential \
    libgtk-3-dev \
    libpipewire-0.3-dev \
    libinih-dev \
    scdoc \
    libpam0g-dev \
    golang \
    waybar \
    curl \
    psmisc \
    swaylock
  
# Install dependencies for wlroots
sudo apt-get build-dep wlroots
export PATH=$PATH:/usr/local/go/bin
