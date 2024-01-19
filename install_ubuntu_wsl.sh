#!/bin/bash

# This script automates setting up my Ubuntu WSL environments.

# Call the base install script
./install_base.sh 

# Install packages
sudo apt update && sudo apt install -y git gcc gdb vim make zsh tmux binutils \
john hugo htop neofetch curl

# Make Oh-My-Zsh install compatible with what I have for Arch
sudo ln -s /home/$USER/.oh-my-zsh /usr/share/oh-my-zsh

# Download Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"