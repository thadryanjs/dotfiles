# Phase 1: "Manual"
# start this running (we're gonna replace it all but switching from an outdated system makes me nervous)
sudo apt update && sudo apt upgrade --yes
sudo upgrade dist
sudo apt install stow git vim-gtk3
done
# make sure you're good to go with keys while it does
ssh-keygen -t ed25519 -C "thadryan@protonmail.com"
cat ~/.ssh/id_ed25519.pub


## Phase 2
# get yoursetup 
git clone git@github.com:thadryanjs/dotfiles.git ~/.dotfiles
git config user.email "thadryan@protonmail.com"
git config user.name "thadryanjs"
# move to trixie (or testing if you want)
# https://linuxiac.com/how-to-switch-from-debian-stable-to-testing/
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
sudo apt update && sudo apt upgrade --yes
# one or both of these? a little fuzzy
sudo upgrade dist
sudo upgrade dist-upgrade
sudo apt auto-remove
sudo apt-add-repository contrib non-free
sudo apt update
reboot


## Phase 3 
# get vim plugin
# done
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# get tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# install your stuff
sudo apt install neovim fzf tmux kitty distrobox python3-venv gcc flatpak podman cifs-utils openconnect wget silversearcher-ag fonts-ubuntu nodejs fuse tree r-base npm --yes
# get flatpaks running
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install vivaldi ferdium discord zotero obsidian gimp spotify sleek app/org.videolan.VLC/x86_64/stable
# tresorit
wget https://installer.tresorit.com/tresorit_installer.run
chmod -u+xrw tresorit_installer.run
./tresorit_installer.run

# install micromamba 
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
micromamba create --name .dcsi-mmamba-env.yaml --yes

# gnome tweaks 
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
