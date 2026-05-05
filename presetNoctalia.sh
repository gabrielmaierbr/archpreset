#!/bin/bash
sudo pacman -Syu

programas=(
    git
	curl
    base-devel
	perl
	cmake
	make
	gcc
    xdg-user-dirs
	xdg-desktop-portal
	xdg-desktop-portal-gtk
    sddm
    niri
	xwayland-satellite
	pipewire
    pipewire-alsa
    pipewire-pulse
    pipewire-jack
    wireplumber
	bluez
    bluez-utils
    blueman
    ffmpeg
    gstreamer
	discord
    steam
    vlc
    cava
	networkmanager
	iwd
	noto-fonts
	noto-fonts-emoji
	noto-fonts-cjk
    ttf-dejavu
	ttf-liberation
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
	ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    gnu-free-fonts
	power-profiles-daemon
	polkit-gnome
)

for programa in "${programas[@]}"
do
    echo "Instalando $programa..."
    sudo pacman -S --noconfirm --needed "$programa"
done

xdg-user-dirs-update

driversAMD=(
    mesa
    mesa-utils
    lib32-mesa
    opencl-mesa
    vulkan-mesa-implicit-layers
    linux-firmware
    vulkan-tools
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
sudo systemctl enable networkmanager
sudo systemctl enable bluetooth

programasyay=(
	brightnessctl
	matugen
	ddcutil
	qt6-multimedia-ffmpeg
	cliphist
	wlsunset
	xdg-desktop-portal
	python3
	evolution-data-server
    apple-fonts
    protonplus
    visual-studio-code-bin
    spotify
    brave-bin
    faugus-launcher
    heroic-games-launcher-bin
	imagemagick
)

for apps in "${programasyay[@]}"
do
    echo "Instalando $apps..."
    yay -S --noconfirm "$apps"
done

paru -S noctalia-shell
