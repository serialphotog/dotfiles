#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Load the base functionality
source "$SCRIPT_DIR/installer/_base.sh"

# Install base packages that I'll want
echo -e "${GREEN}[Info]: Installing base CachyOS Linux packages${CLEAR}"
sudo pacman -S wget gcc gdb git binutils binwalk

# Run the install script
echo -e "${GREEN}[Info]: Running the base install script${CLEAR}"
install_base "$SCRIPT_DIR"

# Change the default shell to zsh
echo -e "${GREEN}[Info]: Changing default shell to zsh${CLEAR}"
chsh -s $(which zsh)
