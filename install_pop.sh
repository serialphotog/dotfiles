#!/bin/bash

FLATPAKS_TO_INSTALL=(
    com.spotify.Client
    md.obsidian.Obsidian
    org.inkscape.Inkscape
    com.mattjakeman.ExtensionManager
    org.ghidra_sre.Ghidra
    org.gimp.GIMP
    com.obsproject.Studio
    org.qgis.qgis
)

# Installs the Flatpaks
install_flatpaks() {
    if ! flatpak remote-list | grep -q "flathub"; then
        echo -e "${GREEN}[Info]: Installing Flathub${CLEAR}"
        sudo apt install -y flatpak
        echo -e "${GREEN}[Info]: Adding Flathub repository${CLEAR}"
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    fi

    # Install the packages
    for program in ${FLATPAKS_TO_INSTALL[@]}; do
        echo -e "${GREEN}[Info]: Installing $program flatpak${CLEAR}"
        flatpak install flathub $program -y
    done
}

install_pop() {
    echo -e "${GREEN}[Info]: Installing Pop OS specific stuff${CLEAR}"
    sudo apt install -y code google-chrome-stable

    echo -e "${GREE}[Info]: Removing some useless default packages${CLEAR}"
    sudo apt remove -y geary gnome-weather gnome-contacts gnome-calendar

    echo -e "${GREEN}[Info]: Installing 1Password${CLEAR}"
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt update && sudo apt install -y 1password

    echo -e "${GREEN}[Info]: Installing TailScale${CLEAR}"
    curl -fsSL https://tailscale.com/install.sh | sh

    echo -e "${GREEN}[Info]: Installing Flatpaks${CLEAR}"
    install_flatpaks
}
