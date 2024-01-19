#!/bin/bash

# This script automates setting up my Kali WSL environments.

# Call the base install script
./install_base.sh

# Install packages
sudo apt update && sudo apt install -y kali-linux-large kali-win-kex

# Install Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim