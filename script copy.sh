
# Ensure sudo
sudo -v

# Install basic tools
sudo pacman -S base-devel yay appimagelauncher --noconfirm

# Terminal
# Ja vem com zsh
# TODO arrumar zsh

# Install DevTools
# ================

# Install DevEnvironment
# ======================
# asdf
yay -S --noconfirm asdf-vm

# NodeJS
asdf plugin add nodejs
asdf install nodejs lts-hydrogen
asdf global nodejs lts-hydrogen

# python
asdf plugin add python
asdf install python 3.11.0
asdf global python 3.11.0

# golang
asdf plugin add golang
asdf install golang 1.19.3
asdf global golang 1.19.3


# Install Dev Softwares
# =====================

# VSCode
yay -S visual-studio-code-bin --noconfirm
# Mongo Compass
sudo pacman -S mongodb-compass mongosh-bin --noconfirm
# Insomnia
wget https://github.com/Kong/insomnia/releases/download/core%402022.6.0/Insomnia.Core-2022.6.0.AppImage -O Insomnia.AppImage && \
ail-cli integrate Insomnia.AppImage
# Beekeper
wget https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.7.10/Beekeeper-Studio-3.7.10.AppImage -O beekeeper.AppImage && \ 
ail-cli integrate beekeeper.AppImage

# Android Studio
yay -S android-studio --noconfirm
# Sqlite Browser
sudo pacman -S sqlitebrowser --noconfirm


# Install Utilitarios
# ===================

# Discord
sudo pacman -S discord --noconfirm

# Zoom
yay -S zoom --noconfirm

# Chrome
sudo pacman -S chromium --noconfirm

# hplip Já instalado
# Anki
yay -S  anki-official-binary-bundle --noconfirm

# Obsidian
sudo pacman -S obsidian --noconfirm

# Anydesk
yay -S  anydesk-bin --noconfirm
# TOR Browser
yay -S  torbrowser-launcher --noconfirm
# Peek
sudo pacman -S peek --noconfirm
# Virtualbox
sudo pacman -S virtualbox --noconfirm

# Criativo
# Gimp
sudo pacman -S gimp --noconfirm
# Krita
wget https://download.kde.org/stable/krita/5.1.3/krita-5.1.3-x86_64.appimage -O krita.AppImage && \ 
ail-cli integrate krita.AppImage
# Inkscape
sudo pacman -S inkscape --noconfirm
# Audacity
sudo pacman -S audacity --noconfirm




# Skanlite
# Okular