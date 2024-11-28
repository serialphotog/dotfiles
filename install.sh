#!/bin/bash

# Load the base functions
source base.sh

# Set up some necessary stuff
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Determine what to install
case $1 in
    "wsl")
        echo -e "${GREEN}[Info]: Install target is WSL${CLEAR}"
        install_omzsh_ubuntu
        install_base $SCRIPT_DIR
        install_ubuntu_packages
        source install_ubuntu_wsl.sh
        install_wsl
        ;;
    "pop")
        echo -e "${GREEN}[Info]: Install target is Pop OS${CLEAR}"
        install_omzsh_ubuntu
        install_base $SCRIPT_DIR
        install_ubuntu_packages
        source install_pop.sh
        install_pop

        echo -e "${GREEN}[Info]: Installing powerline fonts${CLEAR}"
        cd /tmp
        git clone https://github.com/powerline/fonts.git --depth=1
        cd fonts
        ./install.sh
        cd ..
        rm -rf ./fons

        echo -e "${GREE}[Info]: Setting default shell to ZSH${CLEAR}"
        chsh -s $(which zsh)

        echo -e "$GREEN[Info]: Finished installing. Rebooting now${CLEAR}"
        sudo reboot now
        ;;
    "arch")
        echo -e "${GREEN}[Info]: Install target is Arch${CLEAR}"
        install_base $SCRIPT_DIR
        source install_tools_arch.sh
        install_arch
        ;;
    *)
        echo -e "${RED}[Error]: Please specifiy an install target${CLEAR}"
        ;;
esac
