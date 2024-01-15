#!/bin/bash

# Provides some default setup options for Gnome

# Prefer dark mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Better alt-tab behavior
gsettings set org.gnome.desktop.wm.keybindings switch-applications '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

# Bring back all window buttons
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Disable bell on console
gsettings set org.gnome.Console audible-bell false
gsettings set org.gnome.Console visual-bell false

# Enable 12h clock
gsettings set org.gnome.desktop.interface clock-format '12h'

# Disable hot corners
gsettings set org.gnome.desktop.interface enable-hot-corners false
