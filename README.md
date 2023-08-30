# Install Hyprland on any Debian or Ubuntu based distro with Ricing
# All the thems i took from prasanthrangan
> **Note**
>
> thanks to prasanthrangan's work, I only took his themes and modified the scripts so that they could work in debian
>[prasanthrangan github page](https://github.com/prasanthrangan/hyprdots)

# Distro Compatibility

* Tested on Ubuntu (gnome) Lunar Lobster
* Tested on Ubuntu cinnamon Lunar Lobster
* you tell me ...

## Part 1 : Installing Hyprland and utilities (bar, wallpaper changer, etc.)

STEP 1 : Edit the apt sorces list

```
sudo nano /etc/apt/sources.list
```
> Uncomment all lines starting with deb-src (if none, skip)

STEP 2 :
> Install run dependencies and make dependencies from official repo
>> FYI : I used nala instead of apt
>>> Some dependencies will be needed to be built from source (see Step 4)
```
sudo apt-get install waybar golang-go check libgtk-3-dev libsystemd0 libsystemd-dev libegl1-mesa libegl1-mesa-dev libgbm1 libgbm-dev libgles2-mesa-dev meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libvulkan-dev libvulkan-volk-dev  vulkan-validationlayers-dev libvkfft-dev libgulkan-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev libpango1.0-dev xdg-desktop-portal-wlr hwdata git libdrm-dev gdb xwayland libliftoff-dev libdisplay-info-dev libpipewire-0.3-dev libinih-dev libgmp-dev scdoc libpam0g libpam0g-dev valgrind libgtk-4-1 libgtk-4-dev edid-decode 
```

STEP 3 : Install Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
```
rustup default 1.7.0
```

> **Warning**
>
> When you installing rustup, select nightly version othervise you wont be able to build pacakge
> Also if you have nvidia gpu, go to Hyprland nvidia page and aplay sugestions For more details, please refer [Hyprland Nvidia](https://wiki.hyprland.org/Nvidia/) 
   
STEP 4 : Build some dependencies from source

> Why? Why is this not added to script, I want you to do this manually because the compilor may show error while building, all errors are highlighted by the color red in your terminal, If you see any error regarding a certain build dependency, then google it or ask some AI bot which package should you install via apt to fulfill that dependency

STEP 4.1 : libdisplay-info
```
git clone https://gitlab.freedesktop.org/emersion/libdisplay-info.git
```
```
mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release &&
ninja
```
```
sudo ninja install &&
cd ..
```

STEP 4.2 : libliftoff

```
git clone https://salsa.debian.org/debian/libliftoff.git
```
```
meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
```
```
cd build &&
ninja
```
```
sudo ninja install &&
cd ..
```
STEP 4.3 : wayland-protocols

```
wget https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.32/downloads/wayland-protocols-1.32.tar.xz
```
```
tar -xvJf wayland-protocols-1.32.tar.xz
```
```
cd wayland-protocols-1.32

mkdir build &&
cd    build &&
```
```
meson setup --prefix=/usr --buildtype=release &&
ninja
```
```
sudo ninja install
```
STEP 4.4 : wayland

```
wget https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz
```

```
cd wayland-1.22.0
mkdir build &&
cd    build &&
```
```
meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -Ddocumentation=false &&
ninja
```
```
sudo ninja install &&
cd ../..
```
STEP 4.5 : libinput

```
git clone https://gitlab.freedesktop.org/libinput/libinput
```
```
cd libinput
```
```
git clone https://gitlab.freedesktop.org/libinput/libinput
```
```
cd libinput
```
```
meson --prefix=/usr builddir/
```
```
ninja -C builddir/
```
```
sudo ninja -C builddir/ install
```
```
sudo systemd-hwdb update
```

STEP 5 : YAY ! Manual Installations completed, now you can run script :
clone and execute -

STEP 5A : Build Hyprland and utilities

```shell
sudo apt install git
git clone https://github.com/Senshi111/debian-hyprland-hyprdots.git
cd ~/debian-hyprland-hyprdots/build-hyprland-and-apps
./install-all.sh
```
> Now lets verify if everything has installed :
```shell
which Hyprland && which  swww &&  which  swappy && which  wl-copy && which  swaylock && which  nwg-look
```
>> Verify all above packages have a path
>>> I was not able to build swww and xdg-desktop-portal-hyprland through installation script; so I installed it via nix-env
* What is nix-env ? -> https://www.youtube.com/watch?v=BwEIXIjLTNs

```
nix-env -iA nixpkgs.swww
```
```
nix-env -iA nixpkgs.xdg-desktop-portal-hyprland
```

> nix-env installation for other packages (if install_all.sh script could not install)
```
nix-env -iA nixpkgs.swappy
```
```
nix-env -iA nixpkgs.wl-clipboard
```
```
nix-env -iA nixpkgs.swaylock
nix-env -iA nixpkgs.swaylock-effects
```
> Why not install even Hyprland via nix-env?
> > Answer : does not work

STEP 5B : Get Themes

```
cd ~/debian-hyprland-hyprdots/Theme/Configs/
```
```
rsync -avxHAXP --exclude '.git*' .* ~/
```

```shell
cd ~/debian-hyprland-hyprdots/Theme/Scripts
./install.sh

```

> **Note**
>
> You can also create your own list (for ex. `custom_apps.lst`) with all your favorite apps and pass the file as a parameter to install it -
>```shell
>./install.sh custom_apps.lst
>```

Please reboot after the install script completes and takes you to sddm login screen (or black screen) for the first time.   
For more details, please refer [installation.md](https://github.com/prasanthrangan/hyprdots/blob/main/installation.md)


### Theming
To add your own custom theme, please refer [theming.md](https://github.com/prasanthrangan/hyprdots/blob/main/theming.md)
- Available themes
    - [x] Catppuccin-Mocha
    - [x] Catppuccin-Latte
    - [x] Decay-Green
    - [x] Rosé-Pine
    - [x] Tokyo-Night
    - [x] Material-Sakura
    - [x] Graphite-Mono
    - [x] Cyberpunk-Edge
    - [ ] Frosted-Glass (maybe later)
    - [ ] Gruvbox-Retro (maybe later)
    - [ ] Nordic-Blue (maybe later)

| Catppuccin-Mocha |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_mocha_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_mocha_2.png) |

| Catppuccin-Latte |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_latte_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_latte_2.png) |

| Decay-Green |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_decay_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_decay_2.png) |

| Rosé-Pine |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_rosine_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_rosine_2.png) |

| Tokyo-Night |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_tokyo_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_tokyo_2.png) |

| Material-Sakura |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_maura_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_maura_2.png) |

| Graphite-Mono |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_graph_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_graph_2.png) |

| Cyberpunk-Edge |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_cedge_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_cedge_2.png) |


### Rofi
| launchers |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_sel.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_2.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_3.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_4.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_5.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_6.png) |


<details>
<summary><h4>Packages</h4></summary>

| tools | |
| :-- | --- |
pipewire | audio and video server
pipewire-alsa | for audio
pipewire-audio | for audio
pipewire-jack | for audio
pipewire-pulse | for audio
wireplumber | audio and video server
network-manager | network manager
network-manager-gnome | nm tray
bluez | for bluetooth
blueman | bt tray
brightnessctl | brightness control for laptop

| login | |
| :-- | --- |
sddm-git | display manager for login
qt5-wayland | for QT wayland XDP
qt6-wayland | for QT wayland XDP

| hypr | |
| :-- | --- |
hyprland-git | main window manager 
dunst | graphical notification daemon
rofi-lbonn-wayland | app launcher
waybar | status bar
swww | wallpaper app
swayidle | idle management daemon
wlogout | logout screen
grim | screenshot tool
slurp | selects region for screenshot/screenshare
swappy | screenshot editor
cliphist | clipboard manager

| dependencies | |
| :-- | --- |
polkit-kde-agent | authentication agent
xdg-desktop-portal-hyprland-git | XDG Desktop Portal
xdg-desktop-portal-gtk | XDG Desktop Portal file picker
imagemagick | for kitty/neofetch image processing
qt5-imageformats | for dolphin thumbnails
pavucontrol | audio settings gui
pamixer | for waybar audio

| theming | |
| :-- | --- |
nwg-look | theming GTK apps
kvantum | theming QT apps
qt5ct | theming QT5 apps

| applications | |
| :-- | --- |
firefox | browser
kitty | terminal
neofetch | fetch tool
dolphin | kde file manager
visual-studio-code | gui code editor
vim | text editor
ark | kde file archiver

| shell | |
| :-- | --- |
zsh | main shell
exa | colorful file lister
oh-my-zsh-git | for zsh plugins
pokemon-colorscripts-git | display pokemon sprites

</details>


<details>
<summary><h4>Keybindings</h4></summary>

| Keys | Action |
| :--  | :-- |
| `Super` + `Q`| quit active/focused window
| `Super` + `Del` | quit hyprland session
| `Super` + `W` | toggle window on focus to float
| `Alt` + `Enter` | toggle window on focus to fullscreen
| `Alt` + `J` | toggle layout
| `Super` + `G` | disable hypr effects for gamemode
| `Super` + `T` | launch kitty terminal
| `Super` + `E` | launch dolphin file explorer
| `Super` + `V` | launch Vs code
| `Super` + `F` | launch firefox
| `Super` + `A` | launch desktop applications (rofi)
| `Super` + `Tab` | switch open applications (rofi)
| `Super` + `R` | browse system files (rofi)
| `F10` | mute audio output (toggle)
| `F11` | decrease volume (hold)
| `F12` | increase volume (hold)
| `Super` + `L` | lock screen
| `Super` + `Backspace` | logout menu
| `Super` + `P` | screenshot snip
| `Super` + `Alt` + `P` | print current screen
| `Super` + `RightClick` | resize the window 
| `Super` + `LeftClick` | change the window position
| `Super` + `MouseScroll` | cycle through workspaces
| `Super` + `Shift` + `←` `→` `↑` `↓` | resize windows (hold)
| `Super` + `[0-9]` | switch to workspace [0-9]
| `Super` + `Shift` + `[0-9]` | move active window to workspace [0-9]
| `Super` + `Alt` + `S` | move window to special workspace
| `Super` + `S` | toogle to special workspace
| `Super` + `Alt` + `→` | next wallpaper
| `Super` + `Alt` + `←` | previous wallpaper
| `Super` + `Alt` + `↑` | next waybar mode
| `Super` + `Alt` + `↓` | previous waybar mode
| `Super` + `Shift` + `T` | theme select menu
| `Super` + `Shift` + `A` | rofi style select menu

</details>


<details>
<summary><h4>Playlist</h4></summary>

| youtube |
| --- |
| [![IMAGE ALT TEXT](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/yt_playlist.png)](https://www.youtube.com/watch?v=_nyStxAI75s&list=PLt8rU_ebLsc5yEHUVsAQTqokIBMtx3RFY) |

</details>


<details>
<summary><h4>To-Do</h4></summary>

- [x] Wallpaper change script (ver2)
- [x] Theme selector script
- [x] Theme change script (ver2)
- [x] Update rofi configs
- [x] Clipboard manager in waybar
- [x] Add options to install script (ver2)
- [x] Dynamic waybar config generator script
- [x] Media control mpris module for waybar
- [x] Update Volume control script/notification (ver2)
- [x] Rofi config change script + add new configs
- [x] Make wlogout configs dynamic and sync with theme
- [ ] Wallpaper select script with rofi menu
- [ ] Fix rofi configs/scripts for dynamic scaling
- [ ] Sync PC/keyboard hw rgb with current theme (themeswitch.sh + openrgb)
- [ ] Add battery and brightness indicator/notification for laptop users
- [ ] Replace waybar with Eww? (maybe later)

</details>


<details>
<summary><h4>Known Issues</h4></summary>

- [ ] Random lockscreen crash, refer https://github.com/swaywm/sway/issues/7046
- [ ] Waybar launching rofi breaks mouse input (added `sleep 0.1` as workaround), refer https://github.com/Alexays/Waybar/issues/1850
- [ ] Flatpak QT apps does not follow system theme

</details>

