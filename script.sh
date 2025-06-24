#!/bin/sh

# $ sudo nano /etc/pacman.conf
# ParallelDownloads = 5

# sudo pacman-mirrors --continent
# sudo pacman -Syyu


PACKAGES=(
    # Dev
    sqlitebrowser
    virtualbox # tem que habilitar algumas flag de kernel
    dbeaver

    # Web
    discord
    chromium

    # Creative
    gimp
    inkscape
    audacity
    darktable
    obs-studio

    # General Tools
    obsidian
    peek
    fd
    calibre
    flameshot
    vlc
    timeshift
)
AUR_PACKAGES=(
    # Dev
    # mongodb-compass
    # mongosh-bin
    asdf-vm
    visual-studio-code-bin
    # android-studio
    forticlient-vpn

    # General
    zoom
    anki-official-binary-bundle
    anydesk-bin
    torbrowser-launcher

)

# TODO sort mirrors

# Ensure sudo
sudo -v

# Install basic tools
sudo pacman -S base-devel yay appimagelauncher --noconfirm

# Install Packages
sudo pacman -S ${PACKAGES[@]} --noconfirm
sudo pacman -Sc --noconfirm
yay -S ${AUR_PACKAGES[@]} --noconfirm
yay -Sc --noconfirm

# Install AppImage Software

# Insomnia
wget https://github.com/Kong/insomnia/releases/download/core%4011.2.0/Insomnia.Core-11.2.0.AppImage -O Insomnia.AppImage && \
ail-cli integrate Insomnia.AppImage
# Beekeper
wget https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v5.2.10/Beekeeper-Studio-5.2.10.AppImage -O beekeeper.AppImage && \ 
ail-cli integrate beekeeper.AppImage
# Krita
wget https://download.kde.org/stable/krita/5.2.9/krita-5.2.9-x86_64.AppImage -O krita.AppImage && \ 
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
asdf install nodejs 20.17.0
asdf install nodejs 22.16.0
asdf global nodejs 22.16.0

# # python
# asdf plugin add python
# asdf install python 3.11.0
# asdf global python 3.11.0

# golang
asdf plugin add golang
asdf install golang 1.24.4
asdf global golang 1.24.4


# TODO replace VSCODE with opensource
