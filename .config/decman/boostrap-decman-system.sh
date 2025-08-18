"""
In archinstall:
    Filesystem:
        - btrfs snapshots
        - Default layout
        - Standard compression
        - snapper
    Profile:
        - sway
    Audio:
        - Pipewire
    Additional packages:
        - git gvim stow gdm

In minimal arch install:

    # if you forgot to do it
    sudo pacman -S git gvim stow gdm

    git clone https://github.com/thadryanjs/dotfiles.git ~/.dotfiles
    # you should have this guide locally now

    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd

    git clone https://aur.archlinux.org/decman.git
    cd decman
    makepkg -si
    cd

    cd .dotfiles
    stow . --adopt
    git reset *

    decman --source ~/.dotfiles/.config/decman/arch-sway-minignome.py

! The first time, see what decman is going to delete and add those packages to the base packages
"""

sudo timedatectl set-timezone America/New_York

mkdir ~/Downloads/MarkDownload

chmod -u+xrw /home/thadryan/.dotfiles/.config/sway/manage-closed-lid-refresh.sh

sudo systemctl start gdm.service
sudo systemctl enable gdm.service

sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

git config --global user.email "thadryan@protonmail.com"
git config --global user.name "thadryanjs"

cd ~/.dotfiles
git remote set-url origin git@github.com:thadryanjs/dotfiles.git
cd

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# to install plugins
# ctrl-b I, or strl-space if my config is there

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


wget https://installer.tresorit.com/tresorit_installer.run
chmod -u+xrw tresorit_installer.run
# ./tresorit_installer.run

sudo timedatectl set-timezone America/New_York

mkdir ~/Downloads/MarkDownload

chmod -u+xrw /home/thadryan/.dotfiles/.config/sway/manage-closed-lid-refresh.sh

sudo systemctl start gdm.service
sudo systemctl enable gdm.service

sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DejaVuSansMono.zip
unzip DejaVuSansMono.zip
sudo mkdir ~/.local/share/fonts/
sudo cp DejaVuSansMNerdFont*.ttf ~/.local/share/fonts
rm DejaVuSansMNerdFont*.ttf
rm DejaVuSansMono.zip LICENSE.txt README.md

sh .scripts/import-spotify-gpg-keys.sh


"""
Set up git keys:
    ssh-keygen -t ed25519 -C "thadryan@protonmail.com"
    cat ~/.ssh/id_ed25519.pub

Set boot order with efibootmgr

- Open Neovim:
    - Run :COQdeps
    - Run :COQsnips compile
    - Mason to install LSPs if desired.
"""
