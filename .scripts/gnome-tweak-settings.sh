#!/usr/bin/env bash
set -euo pipefail

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
