# Phase 1: "Manual"
# start this running (we're gonna replace it all but switching from an outdated system makes me nervous)
sudo apt update && sudo apt upgrade --yes
sudo upgrade dist
sudo apt install stow git vim-gtk3
# make sure you're good to go with keys while it does
ssh-keygen -t ed25519 -C "thadryan@protonmail.com"
cat ~/.ssh/id_ed25519.pub
# put them in github


## Phase 2
# get yoursetup
git clone git@github.com:thadryanjs/dotfiles.git ~/.dotfiles
git config user.email "thadryan@protonmail.com"
git config user.name "thadryanjs"

# If using trixie or testing, etc, do this
# move to trixie (or testing if you want)
# https://linuxiac.com/how-to-switch-from-debian-stable-to-testing/
# sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
# sudo apt update && sudo apt upgrade --yes

# one or both of these? a little fuzzy
sudo upgrade dist
sudo upgrade dist-upgrade
sudo apt auto-remove
sudo apt-add-repository contrib non-free
sudo apt update
reboot


## Phase 3
# get vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# get tmux plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# get tmux

# get flatpaks running
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install vivaldi ferdium discord zotero obsidian gimp spotify sleek app/org.videolan.VLC/x86_64/stable

# if you're using nix for package managment
# install your minimal base stuff and stuff that needs sudo
sudo apt install kitty vim-gtk3 cifs-utils openconnect flatpak fuse --yes
# https://julianhofer.eu/blog/01-silverblue-nix/
# get home-manager running:
# remove stuff that will be nixified
# sudo apt remove stow git --yes
# curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
# . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
# nix-channel --add https://nixos.org/channels/nixpkgs-unstable
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# nix-channel --update
# nix-shell '<home-manager>' -A install
# home-manager switch

# if not using nix
# install your stuff (stow, vim-gtk3, and git are already here)
# sudo apt install neovim fzf tmux kitty distrobox python3-venv gcc flatpak podman cifs-utils openconnect wget silversearcher-ag ripgrep bat fonts-ubuntu nodejs fuse tree r-base npm default-jre grub-customizer --yes
# sudo apt uninstall neovim fzf tmux distrobox python3-venv gcc podman wget silversearcher-ag ripgrep bat fonts-ubuntu nodejs tree r-base npm default-jre --yes

# tresorit
wget https://installer.tresorit.com/tresorit_installer.run
chmod -u+xrw tresorit_installer.run
./tresorit_installer.run

# consider not using ~/Documents and just having vaults in ~

# install micromamba (it's easier to manager if it's a native install)
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
# basic env for data science ad LSPs
micromamba create --name .dcsi-mmamba-env.yaml --yes

# this?
# curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# If on gnome, make a few tweaks
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

# after tresorit is up-to-date
# sudo cp ~/Documents/WorkVault/Areas/Tech/Areas/GNOME/Jolly-Downloads/Jolly-Dark-Icons /usr/share/icons

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DejaVuSansMono.zip

sudo mkdir ~/.local/share/fonts/

cp DejaVuSansMNerdFont*.ttf ~/.local/share/fonts

sudo sh ~/.scripts/install-kanri.sh
sudo sh ~/.scripts/link-kanri-to-vault.sh
