#!/bin/bash

# This script automates setting up my Kali WSL environments.

# Call the base install script
./install_base.sh

# Install packages
sudo apt update && sudo apt install -y kali-linux-large kali-win-kex