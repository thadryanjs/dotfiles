wget https://github.com/trobonox/kanri/releases/download/app-v0.8.0/kanri_0.8.0_amd64.AppImage
chmod +x kanri_0.8.0_amd64.AppImage
sudo mkdir -p /usr/local/share/kanri
sudo mv kanri_0.8.0_amd64.AppImage /usr/local/bin/kanri
wget https://github.com/kanriapp/kanri/blob/main/src-tauri/icons/icon.png?raw=true
mv 'icon.png?raw=true' kanri.png
sudo mv kanri.png /usr/local/share/kanri/
sudo cp ~/WorkVault/Areas/Tech/Kanri/kanri.desktop /usr/share/applications/kanri.desktop

