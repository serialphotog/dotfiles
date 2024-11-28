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

    # Get common ISOs I typically need
    get_isos

    # Get password/word lists
    get_lists
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
    tmux gnome-boxes golang virt-manager nmap ncat wireshark hping3 iperf3
}

# Gets various ISOs I pretty much always want for my machines
get_isos() {
    echo -e "${GREEN}[Info]: Obtaining standard ISOs${CLEAR}"
    mkdir -p /home/$USER/tools/ISOs

    echo -e "${GREEN}[Info]: Obtaining Tails ISO...${CLEAR}"
    wget -O /home/$USER/tools/ISOs/tails-6.9.iso https://download.tails.net/tails/stable/tails-amd64-6.9/tails-amd64-6.9.iso

    echo -e "${GREEN}[Info]: Obtaining Kali ISO...${CLEAR}"
    wget -O /home/$USER/tools/ISOs/kali-2024.3.iso https://cdimage.kali.org/kali-2024.3/kali-linux-2024.3-installer-amd64.iso
}

# Gets common password/wordlists I like to have on hand
get_lists() {
    echo -e "${GREEN}[Info]: Obtaining password/word lists${CLEAR}"
    mkdir -p /home/$USER/tools/lists

    echo -e "${GREEN}[Info]: Obtaining Rock You password list...${CLEAR}"
    wget -O /home/$USER/tools/lists/rockyou.txt.gz https://github.com/00xBAD/kali-wordlists/raw/refs/heads/master/rockyou.txt.gz
    gzip -d /home/$USER/tools/lists/rockyou.txt.gz

    echo -e "${GREEN}[Info]: Obtaining dirbuster lists...${CLEAR}"
    mkdir -p /home/$USER/tools/lists/dirbuster
    wget -O /home/$USER/tools/lists/dirbuster/directory-list-lowercase-2.3-small.txt https://github.com/00xBAD/kali-wordlists/raw/refs/heads/master/dirbuster/directory-list-lowercase-2.3-small.txt
    wget -O /home/$USER/tools/lists/dirbuster/directory-list-lowercase-2.3-medium.txt https://github.com/00xBAD/kali-wordlists/raw/refs/heads/master/dirbuster/directory-list-lowercase-2.3-medium.txt
    wget -O /home/$USER/tools/lists/dirbuster/directory-list-2.3-small.txt https://github.com/00xBAD/kali-wordlists/raw/refs/heads/master/dirbuster/directory-list-2.3-small.txt
    wget -O /home/$USER/tools/lists/dirbuster/directory-list-2.3-medium.txt https://github.com/00xBAD/kali-wordlists/raw/refs/heads/master/dirbuster/directory-list-2.3-medium.txt
    wget -O /home/$USER/tools/lists/dirbuster/directory-list-1.0.txt https://github.com/00xBAD/kali-wordlists/raw/refs/heads/master/dirbuster/directory-list-1.0.txt

    echo -e "${GREEN}[Info]: Obtaining John password list...${CLEAR}"
    wget -O /home/$USER/tools/lists/john.lst https://github.com/00xBAD/kali-wordlists/raw/refs/heads/master/john.lst
}