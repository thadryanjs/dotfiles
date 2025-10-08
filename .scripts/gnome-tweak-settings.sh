#!/usr/bin/env bash
set -euo pipefail

# misc
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

# if you're not useing the vertical workspace plugin

# this one needs to be unset first
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>l']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>h']"

# with the vertical workspaces plugin
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Alt>k']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control><Alt>j']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"

# hotkey
BASE_KEY="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
KEY_NAME="custom0"
KEY_PATH="${BASE_KEY}/${KEY_NAME}/"

GSCMD="org.gnome.settings-daemon.plugins.media-keys"
CUR=$(gsettings get ${GSCMD} custom-keybindings)

# Normalize empty list
if [[ "${CUR}" == "@as []" ]] || [[ "${CUR}" == "[]" ]]; then
  NEW="['${KEY_PATH}']"
else
  # If KEY_PATH is already present, do nothing
  if echo "${CUR}" | grep -Fq "${KEY_PATH}"; then
    NEW="${CUR}"
  else
    # Insert before the final ]
    # Use | as sed delimiter to avoid / conflicts
    NEW=$(echo "${CUR}" | sed "s|]$|, '${KEY_PATH}']|")
  fi
fi

# Apply new bindings list if changed
if [[ "${NEW}" != "${CUR}" ]]; then
  gsettings set ${GSCMD} custom-keybindings "${NEW}"
fi

# Now define the custom keybinding (this will overwrite if exists)
gsettings set ${GSCMD}.custom-keybinding:${KEY_PATH} name 'Kitty Maximized'
gsettings set ${GSCMD}.custom-keybinding:${KEY_PATH} command 'kitty --start-as=maximized'
gsettings set ${GSCMD}.custom-keybinding:${KEY_PATH} binding '<Alt>q'
