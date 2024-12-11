# get the image itself
wget https://github.com/trobonox/kanri/releases/download/app-v0.8.0/kanri_0.8.0_amd64.AppImage
# let it do stuff
chmod +x kanri_0.8.0_amd64.AppImage
# put it somewhere
sudo mkdir -p /usr/local/share/kanri
sudo mv kanri_0.8.0_amd64.AppImage /usr/local/bin/kanri
# get the icon
wget https://github.com/kanriapp/kanri/blob/main/src-tauri/icons/icon.png?raw=true
# name the icon something sensible
mv 'icon.png?raw=true' kanri.png
# put the icon somewhere
sudo mv kanri.png /usr/local/share/kanri/
# put a desktop entry where it should be
sudo cp ~/WorkVault/Areas/Tech/Kanri/kanri.desktop /usr/share/applications/kanri.desktop
# the desktop entry contains:
# [Desktop Entry]
# Type=Application
# Name=Kanri
# Exec=/usr/local/bin/kanri
# Icon=/usr/local/share/kanri/kanri.png
