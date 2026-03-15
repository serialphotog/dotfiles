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

    # Install the p10k instant config file
    path="$1/other"
    if [ ! -d $path ]; then
        echo -e "${RED}[Error]: $path does not exist!${CLEAR}"
    else
        if [ ! -f "/home/$USER/.cache/p10k-instant-prompt-adam.zsh" ]; then
            echo -e "${GREEN}[Info]: Installing the p10k instant prompt config file${CLEAR}"
            symlink_file "$path/p10k-instant-prompt-adam.zsh" "/home/$USER/.cache/p10k-instant-prompt-adam.zsh"
        else
            echo -e "${YELLOW}[Warning]: The p10k instant prompt config file already exists. Skipping installation.${CLEAR}"
        fi
    fi

    # Create the `aliases.local` file for aliases that we don't necessarily
    # want to be public.
    echo -e "${GREEN}[Info]: Creating the .aliases.local file${CLEAR}"
    touch /home/$USER/.aliases.local

    # Install GEF
    echo -e "${GREEN}[Info]: Installing GEF${CLEAR}"
    wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py

    # Install Plug for VIM
    echo -e "${GREEN}[Info]: Installing Plug${CLEAR}"
    mkdir -p /home/$USER/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}