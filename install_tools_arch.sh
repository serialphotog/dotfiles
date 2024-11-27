#!/bin/bash

# This is intended to be ran on a new Arch install to do some of the initial
# setup of the box.

install_arch() {
    echo -e "${GREEN}[Info]: Installing Arch specific stuff${CLEAR}"

    # Set up Gnome a bit
    ./setup_gnome.sh

    # Install basic tools from repos
    sudo pacman -S git gcc gdb vim make zsh tmux vscode obsidian binutils nmap \
    wireshark-qt john libvirt virt-manager qemu-full tor torbrowser-launcher \
    hugo opensnitch radare2 rz-cutter htop neofetch

    yay -S oh-my-zsh-git google-chrome ghidra-git spotify

    # Enable necessary system services
    sudo systemctl enable libvirtd.service
    sudo systemctl start libvirtd.service
    sudo systemctl enable virtlogd.service
    sudo systemctl start virtlogd.service
    sudo systemctl enable opensnitchd
    sudo systemctl start opensnitchd
    sudo systemctl enable bluetooth.service
    sudo systemctl start bluetooth.service
}