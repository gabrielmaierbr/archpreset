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
    gst-plugins-bad
    gst-plugins-ugly
    libdvdcss
    nano
    kitty
    fish
    sddm
    hyprland
    thunar
    7zip
    file-roller
    gvfs
    gvfs-mtp
    gvfs-smb
    udisks2
    polkit
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    nwg-look
    qt5ct
    qt6ct
    kvantum
    kvantum-qt5
    qt5-wayland
    qt6-wayland
    gnome-keyring
    polkit-gnome
    base-devel
    trash-cli
    power-profiles-daemon
    xdg-user-dirs
    discord
    steam
    vlc
    cava
    networkmanager
    plymouth
    iwd
    dosfstools
    mtools
    fastfetch
    loupe
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
    noto-fonts
	noto-fonts-emoji
	noto-fonts-cjk
    ttf-dejavu
	ttf-liberation
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
	ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    otf-symbols-nerd-font
    gnu-free-fonts
    ttf-joypixels
    apple-fonts
    bibata-cursor-theme-bin
    protonplus
    visual-studio-code-bin
    spotify
    brave-bin
    faugus-launcher
    heroic-games-launcher-bin
)

for apps in "${programasyay[@]}"
do
    echo "Instalando $apps..."
    yay -S --noconfirm "$apps"
done

git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
~/.local/share/caelestia/install.fish --noconfirm
