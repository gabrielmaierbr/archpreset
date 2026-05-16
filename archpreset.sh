#!/bin/bash
sudo pacman -Syu --noconfirm

programas=(
    git
    curl
    gcc
    wget
    perl
    make
    cmake
	ninja
    python
    ffmpeg
    nano
    fish
	kitty
    sddm
    hyprland
    7zip
	unzip
	zip
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
	java-runtime-common
	gamemode
	lib32-gamemode
	gamescope
	mangohud
	wine
	wine-mono
	winetricks
	libreoffice-fresh
	flatpak
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
    apple-fonts
    protonplus
	protontricks
    vscode
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

bash <(curl -s https://ii.clsty.link/get)
