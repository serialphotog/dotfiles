#!/bin/bash

# The base install script that is common across all platforms.

# Create the symlinks to config files
ln -s /home/$USER/.dotfiles/.zshrc /home/$USER/.zshrc
ln -s /home/$USER/.dotfiles/.vimrc /home/$USER/.vimrc
ln -s /home/$USER/.dotfiles/.tmux.conf /home/$USER/.tmux.conf
ln -s /home/$USER/.dotfiles/.gitignore_global /home/$USER/.gitignore_global
ln -s /home/$USER/.dotfiles/.gitignore /home/$USER/.gitignore
ln -s /home/$USER/.dotfiles/.giconfig /home/$USER/.gitconfig
ln -s /home/$USER/.dotfiles/.gdbinit /home/$USER/.gdbinit
ln -s /home/$USER/.dotfiles/.aliases.zsh /home/$USER/.aliases.zsh