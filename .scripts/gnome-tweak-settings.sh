
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
