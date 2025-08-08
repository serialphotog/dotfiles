#!/bin/bash

# Load the base functionality
source ./installer/_base.sh

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Determine which system to install for
case $1 in
    "pop")
        source ./installer/_pop.sh
        echo -e "${GREEN}[Info]: Installing for PopOS${CLEAR}"

        # Ensure we have wget as we need it later
        sudo apt install -y wget

        # Perform the base install
        install_base $SCRIPT_DIR

        # Perform the PopOS Specific install
        install_pop

        ;;
    "arch")
        echo -e "${GREEN}[Info]: Installing for Arch Linux${CLEAR}"

        # Ensure we have wget as we need it later
        sudo pacman -S wget

        # Perform the base install
        install_base $SCRIPT_DIR
        ;;
    *)
        echo -e "${RED}[Error]: Please specify an install target${CLEAR}"
        ;;
esac