#!/bin/bash

install_pop() {
    echo -e "${GREEN}[Info]: Installing PopOS Specific Stuff${CLEAR}"

    # Apply some settings
    install_settings
}

install_settings() {
    # Autohide the dock
    gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
    gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
    gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode "ALL_WINDOWS"

    # Smaller dock icons
    gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

    # Show the battery percentage
    gsettings set org.gnome.desktop.interface show-battery-percentage true

    # Enable natural scrolling on the touchpad 
    gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

    # Sane numlock config
    gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true 
    gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state true

    # Enable all WM buttons
    gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"

    # Enable alt+drag for windows
    gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'

    # Enable alt+mouse for window resize
    gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
}