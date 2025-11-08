#!/bin/bash

# Color definitions
CLEAR='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Creates a symlink to a file.
#
# NOTE: If the destination already exists, it will rename it to have '.old'
#       appended to the original name (so .bashrc would become .bashrc.old)
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
            echo -e "$dst already exists... Moving it to $dst.old"
            mv $dst $dst.old
        fi

        # Create the symlink
        ln -s $src $dst

        # Create the symlink
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}[Info]: Successfully symlinked $dst to $src${CLEAR}"
        else
            echo -e "${RED}[Error]: Failed to symlink $dst to $src${CLEAR}"
        fi
    fi
}

# Performs the base install that's common across all platforms
install_base() {
    path=$1

    # Install the base dotfiles
    path="$1/dotfiles"
    if [ ! -d $path ]; then
        echo -e "${RED}[Error]: $path does not exist!${CLEAR}"
    else
        shopt -s dotglob
        for filepath in "$path"/*; do
            filename=$(basename "$filepath")
            symlink_file $filepath "/home/$USER/$filename"
        done
    fi

    # Install the Kitty config
    path="$1/kitty"
    if [ ! -d $path ]; then
        echo -e "${RED}[Error]: $path does not exist!${CLEAR}"
    else
        if [ ! -d "/home/$USER/.config/kitty" ]; then
            echo -e "${GREEN}[Info]: Kitty config directory doesn't exist. Creating it.${CLEAR}"
            mkdir -p /home/$USER/.config/kitty
        fi

        if [ -f "/home/$USER/.config/kitty/kitty.conf" ]; then
            echo -e "${GREEN}[Info]: /home/$USER/.config/kitty/kitty.conf already exists. Moving it to kitty.conf.old${CLEAR}"
            mv /home/$USER/.config/kitty/kitty.conf /home/$USER/.config/kitty/kitty.conf.old
        fi

        # Symlink our config to the Kitty config path
        symlink_file "$path/kitty.conf" "/home/$USER/.config/kitty/kitty.conf"
    fi

    # Create the `aliases.local` file for aliases that we don't necessarily
    # want to be public.
    echo -e "${GREEN}[Info]: Creating the .aliases.local file${CLEAR}"
    touch /home/$USER/.aliases.local

    # Install the Hack Nerd Font
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip -O /tmp/Hack.zip
    mkdir -p /home/$USER/.fonts/
    unzip /tmp/Hack.zip -d /home/$USER/.fonts/

    # Install GEF
    echo -e "${GREEN}[Info]: Installing GEF${CLEAR}"
    wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py

    # Install Plug for VIM
    echo -e "${GREEN}[Info]: Installing Plug${CLEAR}"
    mkdir -p /home/$USER/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}