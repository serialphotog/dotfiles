#!/bin/bash

# This is intended to be ran on a new Arch install to do some of the initial
# setup of the box.

# Call the base install script
./install_base.sh

# Set up Gnome a bit
./setup_gnome.sh

# Install basic tools from repos
sudo pacman -S git gcc gdb vim make zsh tmux vscode obsidian binutils nmap \
wireshark-qt john libvirt virt-manager qemu-full tor torbrowser-launcher \
hugo opensnitch radare2 rz-cutter htop

yay -S oh-my-zsh-git google-chrome ghidra-git spotify
