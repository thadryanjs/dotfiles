#!/bin/bash

APPS=(
  "com.discordapp.Discord.desktop"
  # Add more apps here
)

SYSTEM_APPS_DIR="/var/lib/flatpak/exports/share/applications"

toggle_app() {
  local app="$1"
  local file="$SYSTEM_APPS_DIR/$app"
  local backup_file="$file.bkup"

  if [ -f "$file" ]; then
    sudo mv "$file" "$backup_file"
    echo "Hiding $app"
  elif [ -f "$backup_file" ]; then
    sudo mv "$backup_file" "$file"
    echo "Showing $app"
  else
    echo "No system desktop file found for $app, skipping."
  fi
}

for app in "${APPS[@]}"; do
  toggle_app "$app"
done

echo "Done. Reload GNOME Shell (Alt+F2, r, Enter) or log out/in to apply changes."
