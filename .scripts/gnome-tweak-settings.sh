# misc
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

gsettings set org.gnome.shell.app-switcher current-workspace-only true

# desktop
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
# this one needs to be unset first
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>l']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>h']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"

# to-do: figure out how to add the alt-q hotkey

#!/bin/bash

# Make sure we're using bash
# Define the new keybinding path
BASE_KEY="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
KEY_NAME="custom0"
KEY_PATH="${BASE_KEY}/${KEY_NAME}/"

# Get existing custom keybindings
CURRENT_BINDINGS=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

# If list is empty, initialize it properly
if [[ "$CURRENT_BINDINGS" == "@as []" ]]; then
  NEW_BINDINGS="['${KEY_PATH}']"
else
  # Remove trailing ']', add new keybinding, close list
  NEW_BINDINGS=$(echo "$CURRENT_BINDINGS" | sed "s/]$/, '${KEY_PATH}']/")
fi

# Apply new bindings list
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "${NEW_BINDINGS}"

# Now define the custom keybinding
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${KEY_PATH} name 'Kitty Maximized'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${KEY_PATH} command 'kitty --start-as=maximized'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${KEY_PATH} binding '<Alt>q'
