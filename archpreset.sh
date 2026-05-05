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

fontes=(
    ttf-google-fonts-git
    gnu-free-fonts
    otf-aurulent-nerd
    otf-cascadia-code
    otf-codenewroman-nerd
    otf-comicshanns-nerd
    otf-commit-mono
    otf-commit-mono-nerd
    otf-cormorant
    otf-droid-nerd
    otf-fantasque-sans-mono
    otf-fira-mono
    otf-fira-sans
    otf-firamono-nerd
    otf-font-awesome
    otf-geist-mono-nerd
    otf-hasklig-nerd
    otf-hermit-nerd
    otf-ipaexfont
    otf-ipafont
    otf-ipamjfont
    otf-latin-modern
    otf-latinmodern-math
    otf-monaspace
    otf-monaspace-nerd
    otf-opendyslexic-nerd
    otf-overpass
    otf-overpass-nerd
    otf-pomicons
    otf-san-francisco
    otf-symbols-nerd-font
    perl-font-ttf
    ttf-0xproto-nerd
    ttf-3270-nerd
    ttf-agave-nerd
    ttf-anonymous-pro
    ttf-anonymouspro-nerd
    ttf-arimo-nerd
    ttf-arphic-ukai
    ttf-arphic-uming
    ttf-atkinson-hyperlegible
    ttf-baekmuk
    ttf-bigblueterminal-nerd
    ttf-bitstream-vera
    ttf-bitstream-vera-mono-nerd
    ttf-caladea
    ttf-carlito
    ttf-cascadia-code
    ttf-cascadia-code-nerd
    ttf-cascadia-mono-nerd
    ttf-cormorant
    ttf-cousine-nerd
    ttf-crimson
    ttf-crimson-pro
    ttf-crimson-pro-variable
    ttf-croscore
    ttf-d2coding-nerd
    ttf-daddytime-mono-nerd
    ttf-dejavu
    ttf-dejavu-nerd
    ttf-droid
    ttf-envycoder-nerd
    ttf-eurof
    ttf-fantasque-nerd
    ttf-fantasque-sans-mono
    ttf-fira-code
    ttf-fira-mono
    ttf-fira-sans
    ttf-firacode-nerd
    ttf-font-awesome
    ttf-gentium-plus
    ttf-go-nerd
    ttf-google-fonts-git
    ttf-hack
    ttf-hack-nerd
    ttf-hactor
    ttf-hanazono
    ttf-hannom
    ttf-heavydata-nerd
    ttf-hellvetica
    ttf-iawriter-nerd
    ttf-ibm-plex
    ttf-ibmplex-mono-nerd
    ttf-icomoon-feather
    ttf-inconsolata
    ttf-inconsolata-go-nerd
    ttf-inconsolata-lgc-nerd
    ttf-inconsolata-nerd
    ttf-indic-otf
    ttf-input
    ttf-intone-nerd
    ttf-iosevka-nerd
    ttf-iosevkaterm-nerd
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    ttf-joypixels
    ttf-junicode
    ttf-junicode-variable
    ttf-khmer
    ttf-lato
    ttf-lekton-nerd
    ttf-liberation
    ttf-liberation-mono-nerd
    ttf-libertinus
    ttf-lilex-nerd
    ttf-linux-libertine
    ttf-linux-libertine-g
    ttf-mac-fonts
    ttf-martian-mono-nerd
    ttf-material-design-iconic-font
    ttf-material-design-icons-extended
    ttf-merriweather
    ttf-merriweather-sans
    ttf-meslo-nerd
    ttf-meslo-nerd-font-powerlevel10k
    ttf-monaspace-variable
    ttf-monofur
    ttf-monofur-nerd
    ttf-monoid
    ttf-monoid-nerd
    ttf-mononoki-nerd
    ttf-mplus-nerd
    ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    ttf-nerd-fonts-symbols-mono
    ttf-noto-nerd
    ttf-opensans
    ttf-orbitron
    ttf-oswald
    ttf-overpass
    ttf-profont-nerd
    ttf-proggyclean-nerd
    ttf-quintessential
    ttf-roboto
    ttf-roboto-mono
    ttf-roboto-mono-nerd
    ttf-sarasa-gothic
    ttf-sazanami
    ttf-scheherazade-new
    ttf-sharetech-mono-nerd
    ttf-signika
    ttf-sourcecodepro-nerd
    ttf-space-mono-nerd
    ttf-terminus-nerd
    ttf-tibetan-machine
    ttf-tinos-nerd
    ttf-ubuntu-font-family
    ttf-ubuntu-mono-nerd
    ttf-ubuntu-nerd
    ttf-victor-mono-nerd
    ttf-wps-fonts
)

for fonte in "${fontes[@]}"
do
    echo "Instalando $fonte..."
    yay -S --noconfirm "$fonte"
done

sudo systemctl enable sddm
sudo systemctl enable networkmanager
sudo systemctl enable bluetooth

programasyay=(
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
~/.local/share/caelestia/install.fish
