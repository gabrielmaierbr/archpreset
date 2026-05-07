#!/bin/bash
sudo pacman -Syu --noconfirm

programas=(
    git
    curl
    cargo
    gcc
    wget
    perl
    make
    cmake
	ninja
    python
    playerctl
    pipewire
    pipewire-alsa
    pipewire-pulse
    pipewire-jack
    wireplumber
    pavucontrol
    bluez
    bluez-utils
    blueman
    ffmpeg
    gstreamer
    gst-libav
    gst-plugins-base
    gst-plugins-good
    libdvdcss
    nano
    fish
    sddm
    hyprland
    thunar
    7zip
    file-roller
    gvfs
    xdg-desktop-portal
xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    polkit-gnome
    base-devel
    power-profiles-daemon
    xdg-user-dirs
	xdg-utils
    discord
    steam
    vlc
    cava
    ddcutil
	brightnessctl
	app2unit
	libcava
	networkmanager
	lm-sensors
	aubio
	libpipewire
	glibc
	qt6-declarative
	gcc-libs
	caskaydia-cove-nerd
	swappy
	libqalculate
	bash
	qt6-base
	qt6-declarative
    plymouth
    iwd
    dosfstools
    mtools
    fastfetch
	java-runtime-common
	gamemode
	lib32-gamemode
	wine
	wine-mono
	winetricks
	wine-staging
	qt6-svg
	qt6-virtualkeyboard
	qt6-multimedia-ffmpeg
)

for programa in "${programas[@]}"
do
    echo "Instalando $programa..."
    sudo pacman -S --noconfirm --needed "$programa"
done

xdg-user-dirs-update
sudo gpasswd --add $USER gamemode

driversAMD=(
    mesa
    mesa-utils
    lib32-mesa
    opencl-mesa
    vulkan-mesa-implicit-layers
    linux-firmware-radeon
    vulkan-icd-loader
	lib32-vulkan-icd-loader
	vulkan-radeon
	lib32-vulkan-radeon
	vulkan-headers
	vulkan-tools
	xf86-video-amdgpu
    amd-ucode
)

for driver in "${driversAMD[@]}"
do
    echo "Instalando $driver..."
    sudo pacman -S --noconfirm --needed "$driver"
done

echo "Instalando Paru"
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm

paru -S yay --noconfirm

sudo systemctl enable sddm
sudo systemctl enable bluetooth

programasparu=(
    noto-fonts
	noto-fonts-emoji
	noto-fonts-cjk
    ttf-dejavu
	ttf-liberation
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
	ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
	ttf-vista-fonts
    apple-fonts
    protonplus
	protontricks
    visual-studio-code-bin
    spotify
    brave-bin
    faugus-launcher
    heroic-games-launcher-bin
	sddm-silent-theme
)

for apps in "${programasparu[@]}"
do
    echo "Instalando $apps..."
    paru -S --noconfirm "$apps"
done

git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
~/.local/share/caelestia/install.fish --noconfirm
