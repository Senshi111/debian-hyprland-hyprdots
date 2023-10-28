# All the thems i took from prasanthrangan
> **Note**
>
> thanks to prasanthrangan's work, I only took his themes and modified the scripts so that they could work in debian
>[prasanthrangan github page](https://github.com/prasanthrangan/hyprdots) 




# --// Hyprdots //--


<p align="center">
  <img width="250" src="https://github-production-user-asset-6210df.s3.amazonaws.com/40372242/263763138-8254e6be-9537-4388-90f8-c418124c8284.png">
</p>
    


## My Debian Sid Hyprland Config
https://user-images.githubusercontent.com/106020512/235429801-e8b8dae2-c1ad-4e23-9aa2-b1edb6cabe99.mp4

| <!-- --> | <!-- --> |
| --- | --- |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/showcase_1.png) | ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/showcase_2.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/showcase_3.png) | ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/showcase_4.png) |


### Installation

> **Warning**
>
> When you installing rustup, select nightly version othervise you wont be able to build pacakge
> Also if you have nvidia gpu, go to Hyprland nvidia page and aplay sugestions For more details, please refer [Hyprland Nvidia](https://wiki.hyprland.org/Nvidia/) 
   

After minimal (or any other) Debian install (with grub), clone and execute -
```shell
sudo apt install git
git clone https://github.com/Senshi111/debian-hyprland-hyprdots.git
cd ~/debian-hyprland-hyprdots/build-hyprland-and-apps
./install_all.sh

cd ~/debian-hyprland-hyprdots/Theme/Scripts
./install.sh

```

> **Warning**
>
> If you dont have pyamdgpuinfo installed
```shell
sudo apt install python3-pip
pip install pyamdgpuinfo
```
> if you got an  #error: externally-managed-environment
```shell
sudo mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old
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
    - [ ] Nordic-Blue (maybe later)

- Contributors themes
    - [x] Frosted-Glass by T-Crypt
    - [x] Gruvbox-Retro by T-Crypt

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

| Frosted-Glass |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_frosted_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_frosted_2.png) |

| Gruvbox-Retro |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_gruvbox_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_gruvbox_2.png) |


### Styles

| Theme Select |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_select.png) |

| Wallpaper Select |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/walls_select.png) |

| Launcher Style Select |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_sel.png) |

| Launcher Styles |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_2.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_3.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_4.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_5.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_6.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_7.png) |

| Wlogout Menu |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/wlog_style_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/wlog_style_2.png) |

| Game Launchers |
| :-: |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_1.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_2.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_3.png) |
| ![](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_4.png) |


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
| `Super` + `G` | toggle window group
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
| `Super` + `Alt` + `G` | disable hypr effects for gamemode

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

