#!/bin/bash

# This script automates setting up my Kali WSL environments.

# Call the base install script
./install_base.sh

# Install packages
sudo apt update && sudo apt install -y kali-linux-default kali-win-kex

# Install Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add aliases to Kali's ZSH config
echo 'source ~/.aliases.local' >> ~/.bashrc
