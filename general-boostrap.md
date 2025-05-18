# General system setup
This is the non distro-specific stuff for my current workflow.

## Configure keys
```
ssh-keygen -t ed25519 -C "thadryan@protonmail.com"
cat ~/.ssh/id_ed25519.pub
```
Add them to in github.

## Get dotfile setup
```
git clone git@github.com:thadryanjs/dotfiles.git ~/.dotfiles
git config user.email "thadryan@protonmail.com"
git config user.name "thadryanjs"
```

## get Tmux plugins
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Get Vim plugins
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install Tresorit
```
wget https://installer.tresorit.com/tresorit_installer.run
chmod -u+xrw tresorit_installer.run
./tresorit_installer.run
# consider not using ~/Documents and just having vaults in ~
```

## Install micromamba
It's easier to manage if it's a native install. Using a package manager always ends in pain.
```
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
# basic env for data science ad LSPs
micromamba create --file .dsci-mmamba-env.yaml --yes
```

## Tweak Gnome, if applicable
```
sh ~/.scripts/gnome-reset.sh
sh ~/.scripts/gnome-tweak-settings.sh
```

## Set nerd font
```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DejaVuSansMono.zip
unzip DejaVuSansMono.zip
sudo mkdir ~/.local/share/fonts/
sudo cp DejaVuSansMNerdFont*.ttf ~/.local/share/fonts
rm DejaVuSansMNerdFont*.ttf
rm DejaVuSansMono.zip LICENSE.txt README.md
```

## Cleanup
```
rm tresorit_installer.run
```
