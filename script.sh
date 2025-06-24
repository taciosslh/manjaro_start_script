#!/bin/sh

# TODO

# $ sudo nano /etc/pacman.conf
# ParallelDownloads = 5

# sudo pacman-mirrors --continent
# sudo pacman -Syyu


PACKAGES=(
    # Dev
    sqlitebrowser
    dbeaver
    docker
    jq
    # virtualbox tem que habilitar algumas flag de kernel
    # gnomeboxes

    # Web
    discord
    chromium

    # Creative
    gimp
    inkscape
    audacity
    calibre
    obs-studio

    # General Tools
    flameshot
    obsidian
    peek
    fd
    neofetch
    spotify-launcher
)

AUR_PACKAGES=(
    # Dev
    mongodb-compass
    mongosh-bin
    asdf-vm
    visual-studio-code-bin
    # android-studio

    # General
    zoom
    # anki-official-binary-bundle
    anydesk-bin
    torbrowser-launcher
    
    papirus-folders-git

)

# TODO sort mirrors

# Ensure sudo
sudo -v

sudo pacman -Syyu

# Install basic tools
sudo pacman -S base-devel yay appimagelauncher --noconfirm

# Install Packages
sudo pacman -S ${PACKAGES[@]} --noconfirm
sudo pacman -Sc --noconfirm
yay -S ${AUR_PACKAGES[@]} --noconfirm
yay -Sc --noconfirm

# Install AppImage Software

# Insomnia
wget https://github.com/Kong/insomnia/releases/download/core%402022.6.0/Insomnia.Core-2022.6.0.AppImage -O Insomnia.AppImage && \
ail-cli integrate Insomnia.AppImage
# Beekeper
wget https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.7.10/Beekeeper-Studio-3.7.10.AppImage -O beekeeper.AppImage && \ 
ail-cli integrate beekeeper.AppImage
# Krita
wget https://download.kde.org/stable/krita/5.1.3/krita-5.1.3-x86_64.appimage -O krita.AppImage && \ 
ail-cli integrate krita.AppImage

# Configure ZSH

cp ~/.zshrc ~/.zshrc_old

echo '
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
' | cat - ~/.zshrc > tmp && cat tmp > ~/.zshrc 

cp .p10k.zsh ~/.p10k.zsh

echo '
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
' >> ~/.zshrc 

echo "export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'" >> ~/.zshrc


# Install DevEnvironment
# ======================

source /opt/asdf-vm/asdf.sh

echo 'source /opt/asdf-vm/asdf.sh' >> ~/.zshrc 

# NodeJS
asdf plugin add nodejs
asdf install nodejs lts-hydrogen
asdf global nodejs lts-hydrogen

# python
asdf plugin add python
asdf install python 3.12.6
asdf global python 3.12.6

# golang
# asdf plugin add golang
# asdf install golang 1.19.3
# asdf global golang 1.19.3


# TODO replace VSCODE with opensource

# sudo usermod -a -G docker $USER
# sudo systemctl enable docker

# https://github.com/PapirusDevelopmentTeam/papirus-folders
