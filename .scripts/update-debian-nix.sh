sudo apt update
sudo apt upgrade
sudo apt upgrade dist
nix-channel --update
home-manager switch
nix-env --delete-generations +3
nix-collect-garbage
nix store optimise
flatpak update --yes
