#!/bin/bash

# Color definitions
CLEAR='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Creates a symlink
# 
# NOTE: If the destination exists, this will renmae it to have ".old" appended
#       to its name.
symlink_file() {
    src=$1
    dst=$2

    if [ ! -f $src ]; then 
        # The src file to symlink doesn't exist, can't continue
        echo -e "${RED}[Error]: $dst does not exist, can't symlink${CLEAR}"
    else
        echo -e "${GREEN}[Info]: Attempting to symlink $src to $dst${CLEAR}"

        # Backup the original if it exists
        if [ -f $dst ]; then 
            echo -e "$dst already exists. Moving it to $dst.old"
            mv $dst $dst.old
        fi

        # Create the symlink
        ln -s $src $dst 
        if [ $? -eq 0 ]; then 
            echo -e "${GREEN}[Info]: Successfully symlinked $dst to $src${CLEAR}"
        else 
            echo -e "${RED}[Red]: Failed to symlink $dst to $src${CLEAR}"
        fi
    fi
}

# Installs Plug for VIM
install_plug() {
    echo -e "${GREEN}[Info]: Installing Plug${CLEAR}"
    mkdir -p /home/$USER/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# Performs the base install that's common to all platforms
install_base() {
    path=$1

    echo -e "${GREEN}[Info]: Performing the base install${CLEAR}"
    echo -e "${GREEN}[Info]: Creating symlinks to the dotfiles${CLEAR}"

    path="$1/dotfiles"
    if [ ! -d $path ]; then
        echo -e "${RED}$path does not exist!${CLEAR}"
    else
        shopt -s dotglob
        for filepath in "$path"/*; do
            filename=$(basename "$filepath")
            symlink_file $filepath "/home/$USER/$filename"
        done
    fi

    echo -e "${GREEN}[Info]: Creating the .aliases.local file${CLEAR}"
    touch /home/$USER/.aliases.local

    # Install GEF
    echo -e "${GREEN}[Info]: Installing GEF${CLEAR}"
    wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py

    # Install Rust
    echo -e "${GREE}[Info]: Installing Rust${CLEAR}"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    install_plug
    install_powerline_fonts
}

# Installs Oh-My-ZSH on Ubuntu-based distros
install_omzsh_ubuntu() {
    echo -e "${GREEN}[Info]: Installing Oh-My-ZSH... Don't set shell right now, we do it later.${CLEAR}"
    sudo apt install -y zsh
    sudo ln -s /home/$USER/.oh-my-zsh /usr/share/oh-my-zsh # Arch compatibility
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

}

# Installs packages on Ubuntu-based distros
install_ubuntu_packages() {
    echo -e "${GREEN}[Info]: Installing Ubuntu packages${CLEAR}"
    sudo apt update 
    sudo apt install -y git gcc g++ gdb vim make binutils john hugo htop curl \
    tmux gnome-boxes golang virt-manager
}
