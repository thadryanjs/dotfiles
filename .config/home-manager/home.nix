# https://julianhofer.eu/blog/01-silverblue-nix/
# get home-manager running:
# curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
# . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
# nix-channel --add https://nixos.org/channels/nixpkgs-unstable
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# nix-channel --update
# nix-shell '<home-manager>' -A install

# routine maintenance:
# frequent:
# nix-channel --update
# home-manager switch
# # infrequent:
# nix-env --list-generations
# nix-env --delete-generations +3
# nix-collect-garbage
# nix store optimise

{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "thadryan";
  home.homeDirectory = "/var/home/thadryan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    vim-full
    neovim
    tmux
    xclip
    stow
    gcc
    gnumake
    fzf
    ripgrep
    silver-searcher
    bat
    cifs-utils
    sshfs
    R
    micromamba
    python312Packages.pip
    gpclient
    flatpak
    nodejs
    distrobox
    # for the below I had to switch to xorg then back for the icon to show, as did some people on github
    gnome-tweaks
    # requires restart
    gnomeExtensions.vertical-workspaces
    shotwell
    # Run (TODO: configify this):
    # gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
    # gsettings set org.gnome.shell.app-switcher current-workspace-only true
    # gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

    # going with flatpaks for these:
    # wezterm
    # spotify
    # discord
    # vivaldi
    # ferdium
    # libreoffice
    # obsidian
    # zoom
    # sleek
    # zotero
    # shotwell

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "fira-code-nerdfont" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];


  programs.git = {
    enable = true;
    userName  = "thadryanjs";
    userEmail = "thadryan@protonmail.com";
  };



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/thadryan/etc/profile.d/hm-session-vars.sh
  #

  home.sessionVariables = {
  # why didn't this work?
  #  EDITOR = "vi";
  };

  nixpkgs.config = {
      allowUnfree = true;
  };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;



}

