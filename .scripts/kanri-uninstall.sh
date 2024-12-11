#!/bin/bash

# Uninstall script for Kanri

echo "Starting uninstallation of Kanri..."

# Remove the AppImage binary
if [ -f /usr/local/bin/kanri ]; then
    sudo rm /usr/local/bin/kanri
    echo "Removed /usr/local/bin/kanri"
else
    echo "File /usr/local/bin/kanri not found."
fi

# Remove the icon
if [ -f /usr/local/share/kanri/kanri.png ]; then
    sudo rm /usr/local/share/kanri/kanri.png
    echo "Removed /usr/local/share/kanri/kanri.png"
else
    echo "Icon file /usr/local/share/kanri/kanri.png not found."
fi

# Remove the application directory
if [ -d /usr/local/share/kanri ]; then
    sudo rmdir /usr/local/share/kanri
    echo "Removed /usr/local/share/kanri directory"
else
    echo "Directory /usr/local/share/kanri not found."
fi

# Remove the desktop entry
if [ -f /usr/share/applications/kanri.desktop ]; then
    sudo rm /usr/share/applications/kanri.desktop
    echo "Removed /usr/share/applications/kanri.desktop"
else
    echo "Desktop entry /usr/share/applications/kanri.desktop not found."
fi

echo "Kanri uninstallation complete."

