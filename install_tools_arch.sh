#!/bin/bash
#
# This is intended to be ran on a new Arch install to do some of the initial
# setup of the box.

# Install basic tools from repos
sudo pacman -S git gcc gdb vim make zsh tmux vscode obsidian binutils nmap
yay -S oh-my-zsh-git google-chrome ghidra-git spotify
