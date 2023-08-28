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
        libpam0g-dev

# Install dependencies for wlroots
sudo apt-get build-dep wlroots

# Clone and build Hyprland
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
meson build
ninja -C build
sudo ninja -C build install
cd ..

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# Clone and build swww
git clone https://github.com/Horus645/swww.git
cd swww

# Build swww
cargo build --release

# Copy binaries to /usr/bin/
sudo cp target/release/swww /usr/bin/
sudo cp target/release/swww-daemon /usr/bin/

# Copy bash completions
sudo cp completions/swww.bash /usr/share/bash-completion/completions/swww

# Uncomment this section if needed
# Copy fish completions
#sudo mkdir -p /usr/share/fish/vendor_completions.d/
#sudo cp completions/swww.fish /usr/share/fish/vendor_completions.d/swww.fish

# Copy zsh completions
sudo cp completions/_swww /usr/share/zsh/site-functions/_swww

# Return to the previous directory
cd ..


# Clone and build xdg-desktop-portal-hyprland
git clone https://github.com/hyprwm/xdg-desktop-portal-hyprland.git
cd xdg-desktop-portal-hyprland
meson build --prefix=/usr
ninja -C build
# Build hyprland-share-picker
cd hyprland-share-picker && make all && cd ..
ninja -C build install
sudo cp hyprland-share-picker/build/hyprland-share-picker /usr/bin/
cd ..

# Clone and build swappy
git clone https://github.com/jtheoof/swappy.git
cd swappy
meson setup build
ninja -C build
ninja -C build install
cd ..

# Clone and build wl-clipboard
git clone https://github.com/bugaevc/wl-clipboard.git
cd wl-clipboard
# Build and install
meson setup build
cd build
ninja
sudo meson install
cd ..

# Install Go
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go install go.senan.xyz/cliphist@latest

# Clone and install pokemon-colorscripts
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
cd ..


# Clone and install Swaylick-effects
git clone https://github.com/mortie/swaylock-effects.git
cd swaylock-effects
meson build
ninja -C build
sudo ninja -C build install
cd ..

# Clean up
rm -rf Hyprland swww xdg-desktop-portal-hyprland swappy wl-clipboard pokemon-colorscripts swaylock-effects
