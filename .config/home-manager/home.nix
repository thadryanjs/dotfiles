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
  home.username = "thadryan";
  home.homeDirectory = "/home/thadryan";

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
   git
   neovim
   tmux
   xclip
   stow
   gcc
   wget
   rename
   rsync
   tree
   gnumake
   fzf
   ripgrep
   silver-searcher
   bat
   cifs-utils
   sshfs
   R
   jdk
   nodejs
   yazi
   poppler
   ffmpegthumbnailer
   imagemagick
   zoxide
   cmatrix
   # seems cool but I can't find how to set the path when it's install with nix
   # atuin
   # blesh
   # quarto
   # shotwell
   # for the below I had to switch to xorg then back for the icon to show, as did some people on github
   # gnome-tweaks
   # requires restart
   # gnomeExtensions.vertical-workspaces
   # going with flatpaks for these:
   # flatpak install vivaldi ferdium discord zotero obsidian gimp spotify sleek app/org.videolan.VLC/x86_64/stable


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


  # it looks like I need to let it manage my .bashrc (https://discourse.nixos.org/t/home-manager-doesnt-seem-to-recognize-sessionvariables/8488/7)
  # not sure what that entails excactly
  # programs.bash = {
  #   enable = true;
  #   sessionVariables = {
  #     EDITOR = "vim";
  #   };
  #   initExtra = ''
  #     . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
  #   '';
  # };

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

  # sudo env "PATH=$HOME/.nix-profile/bin:$PATH" \
  #        "XDG_CONFIG_HOME=$HOME/.config" \
  #        "XDG_DATA_HOME=$HOME/.local/share" \
  #        "HOME=$HOME" \
  #        "USER=$USER" \
  #        "SHELL=$SHELL" \
  #        "EDITOR=nvim" \
  #        nvim

  home.sessionVariables = {
    # # Ensure your user binaries are on the PATH
    # PATH = "$HOME/.nix-profile/bin:$HOME/.nix-profile/bin:$HOME/.local/bin:$PATH";

    # # Ensure correct XDG variables for your user config & data
    # XDG_CONFIG_HOME = "$HOME/.config";
    # XDG_DATA_HOME = "$HOME/.local/share";

    # # Make sure the HOME and USER variables are set to your user environment
    # HOME = "$HOME";
    # USER = "thadryan";  # Replace 'your-username' with your actual username

    # # Set the SHELL and EDITOR
    # SHELL = "$SHELL";
    # EDITOR = "nvim";
  };

  nixpkgs.config = {
      allowUnfree = true;
  };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;



}

