#!/bin/bash
sudo pacman -Syu

programas=(
    git
    base-devel
    xdg-user-dirs
    sddm
    hyprland
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

git clone --depth 1 https://github.com/HyDE-Project/HyDE ~/HyDE
cd ~/HyDE/Scripts
./install.sh
