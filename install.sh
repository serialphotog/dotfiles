#!/bin/bash

# Load the base functionality
source ./installer/_base.sh

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Install base packages that I'll want
echo -e "${GREEN}[Info]: Installing base Fedora Linux packages${CLEAR}"
sudo dnf install zsh wget cargo fd kitty gcc gdb git binutils binwalk
cargo install eza

# Install oh-my-zsh
echo -e "${GREEN}[Info]: Installing oh-my-zsh${CLEAR}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Run the install script
echo -e "${GREEN}[Info]: Running the base install script${CLEAR}"
install_base $SCRIPT_DIR