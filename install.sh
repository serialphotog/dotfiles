#!/bin/bash

# Load the base functionality
source ./installer/_base.sh

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Determine which system to install for
case $1 in
    "pop")
        source ./installer/_pop.sh
        echo -e "${GREEN}[Info]: Installing for PopOS${CLEAR}"

        # Do the Ubuntu common install 
        install_ubuntu_based

        # Perform the base install
        install_base $SCRIPT_DIR

        # Perform the PopOS Specific install
        install_pop

        ;;
    "ubuntu")
        echo -e "${GREEN}[Info]: Installing for Ubuntu${CLEAR}"

        # Do the Ubuntu common install 
        install_ubuntu_based
        
        # Perform the base install
        install_base $SCRIPT_DIR

        ;;
    "arch")
        echo -e "${GREEN}[Info]: Installing for Arch Linux${CLEAR}"

        # Ensure we have the utilities we need
        sudo pacman -S wget bat eza fd

        # Perform the base install
        install_base $SCRIPT_DIR
        ;;
    *)
        echo -e "${RED}[Error]: Please specify an install target${CLEAR}"
        ;;
esac

install_ubuntu_based() {
    # Ensure we have the utilities we need
    sudo apt install -y wget bat eza fd-find

    # Fix bat on Ubuntu-bases systems
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat

    # Fix fd on Ubuntu-based systems
    ln -s $(which fdfind) ~/.local/bin/fd

    # Ensure we have powerline fonts
    sudo apt-get install fonts-powerline
}