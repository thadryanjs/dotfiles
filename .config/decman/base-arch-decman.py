import socket
import os
# Note: Do NOT use from imports for global variables
# BAD: from decman import packages/modules/etc
import decman
import decman.config
# This is fine since the thing being imported is a class and not a global variable.
from decman import UserPackage, File, Directory, UserRaisedError

# my normal packages
decman.packages += [
    # "grub-btrfs-support",
    # config ui for snapshots
    # "grub-customizer",
    "vivaldi",
    "firefox",
    "git",
    "python",
    "kitty",
    "tree",
    "neovim",
        "xclip",
    "stow",
    "fzf",
        "bat",
        "the_silver_searcher",
        "ripgrep",
    "tmux",
    "atuin",
        # may need a command as arch doesn't create this file I don't think
        # https://github.com/atuinsh/atuin/issues/380
        "bash-preexec",
    "pixi",
    "yazi",
        "poppler",
        "ffmpegthumbnailer",
        "imagemagick",
    "zoxide",
    "discord",
    # for tresorit
    "fuse3",
    "signal-desktop",
    "sway",
        "wofi",
        # still needed for sway-screenshot
        "grim",
        "swaybg",
        # "waybar",
        "nm-connection-editor",
        "swaylock",
        "swayidle",
    "r",
    "nodejs",
        "yarn",
        "npm",
    "cmatrix",
    "ollama",
    "gimp",
    # "texlive",
        "texlive-basic",
        "texlive-bibtexextra",
        "texlive-binextra",
        "texlive-context",
        "texlive-fontsextra",
        "texlive-fontsrecommended",
        "texlive-fontutils",
        "texlive-formatsextra",
        "texlive-games",
        "texlive-humanities",
        "texlive-latex",
        "texlive-latexextra",
        "texlive-latexrecommended",
        "texlive-luatex",
        "texlive-mathscience",
        "texlive-metapost",
        "texlive-music",
        "texlive-pictures",
        "texlive-plaingeneric",
        "texlive-pstricks",
        "texlive-publishers",
        "texlive-xetex",
    # "pandoc",
    "pandoc-cli",
    "rclone"
]

decman.aur_packages += [
    "decman",
    "yay",
    "btrfs-assistant",
    "sway-screenshot",
    "ferdium-bin",
    "etcher-bin",
    # fails - cursed to use the downloaded installer forever I think.
    # "tresorit"
    # first run:
    # curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | gpg --import -
    "spotify",
    "zotero",
    # "swaysettings-git"
]

if "work" in socket.gethostname():
    # work system stuff
    decman.packages += [
        "openconnect",
        "cifs-utils",
    ]
    decman.aur_packages += [
        "zoom",
    ]
else:
    # personal system stuff
    decman.packages += [
        "vlc",
        "obs-studio",
        "gimp",
    ]
    decman.aur_packages += [
        "surfshark-client",
        "viber",
    ]

# mostly untouched base system derived from running decman and seeing what it said would be erased
base_packages = [
    "grub-btrfs",
    "htop",
    "linux",
    "man-db",
    "pipewire-pulse", "pipewire-audio", "pipewire", "wireplumber",
    "slurp", "snap-pac",
    "vulkan-nouveau", "vulkan-radeon",
    "wireless_tools",
    "wmenu",
    "xdg-utils",
    "xf86-video-amdgpu",
    "xf86-video-ati",
    "xf86-video-nouveau",
    "zram-generator",
    "baobab",
    "base",
    "base-devel",
    "brightnessctl",
    "btrfs-progs",
    "decibels",
    "efibootmgr",
    "epiphany",
    "evince",
    "gdm",
    "gnome-calendar",
    "gnome-characters",
    "gnome-clocks",
    "gnome-color-manager",
    "gnome-connections",
    "gnome-console",
    "gnome-control-center",
    "gnome-disk-utility",
    "gnome-font-viewer",
    "gnome-keyring",
    "gnome-logs",
    "gnome-menus",
    "gnome-nettool",
    "gnome-power-manager",
    "gnome-backgrounds",
    "gnome-calculator",
    "gnome-characters",
    "gnome-clocks",
    "gnome-color-manager",
    "gnome-console",
    "gnome-contacts",
    "gnome-control-center",
    "gnome-disk-utility",
    "gnome-font-viewer",
    "gnome-keyring",
    "gnome-logs",
    "gnome-menus",
    "gnome-remote-desktop",
    "gnome-session",
    "gnome-settings-daemon",
    "gnome-shell",
    "gnome-system-monitor",
    "gnome-text-editor",
    "gnome-tweaks",
    "gnome-user-share",
    "gnome-remote-desktop",
    "gnome-session",
    "gnome-settings-daemon",
    "gnome-shell",
    "gnome-shell-extensions",
    "gnome-system-monitor",
    "gnome-terminal",
    "gnome-themes-extra",
    "gnome-tweaks",
    "gnome-usage",
    "gnome-user-share",
    "adwaita-icon-theme",
    "network-manager-applet",
    "grilo-plugins",
    "grub",
    "gvfs", "gvfs-afc", "gvfs-dnssd", "gvfs-goa", "gvfs-google", "gvfs-gphoto2","gvfs-mtp", "gvfs-nfs", "gvfs-onedrive", "gvfs-smb", "gvfs-wsdd",
    "intel-media-driver", "intel-ucode",
    "iwd",
    "libva-intel-driver",
    "linux-firmware",
    "loupe",
    "malcontent",
    "nautilus",
    "networkmanager",
    "openssh",
    "orca",
    "pavucontrol",
    "rygel",
    "simple-scan",
    "smartmontools",
    "snapper",
    "snapshot",
    "sushi",
    "tecla",
    "totem",
    "vim",
    "vulkan-intel",
    "wget",
    "wpa_supplicant",
    # -wlr is needed for screensharing to work
    "xdg-desktop-portal-gnome", "xdg-user-dirs-gtk", "xdg-desktop-portal-wlr",
    "xorg-server", "xorg-xinit",
    "yelp"
]

decman.packages += base_packages

# Ignored packages can be normal packages or aur packages.
decman.ignored_packages += [
    # per the docs
    "decman-git"
]

decman.config.debug_output = False
decman.config.suppress_command_output = True
decman.config.quiet_output = False
# If you don't want to print lines that contain keywords, set this to False
decman.config.print_pacman_output_highlights = True
# The user which builds aur and user packages.
decman.config.makepkg_user = "thadryan" # This was set in a previous example. Let's not override it.
# The build directory decman uses for creating a chroot etc.
decman.config.build_dir = "/tmp/decman/build"
# Built packages are stored here.
decman.config.pkg_cache_dir = "/var/cache/decman"
# Timeout in seconds for fetching aur package details.
decman.config.aur_rpc_timeout = 30
# Enable installing and upgrading foreign packages.
decman.config.enable_fpm = True
# Number of package files per package kept in the cache
# All built AUR packages and user packages are stored in cache.
decman.config.number_of_packages_stored_in_cache = 2
# Decman captures pacman command output, and any line (and adjacent lines) that contains any of
# the following keywords (case-insensetive) will be printed after the pacman command finishes.
# REMEMBER: You should still generally pay attention to pacman output
# since these keywords may not catch all cases.
decman.config.pacman_output_keywords = [
    "pacsave",
    "pacnew",
    # Additional keywords can be:
    # "warning",
    # "error",
    # "note",
    # They might cause too many highlights however.
]

os.environ["GNUPGHOME"] = "/home/thadryan/.gnupg/"
# You then must set the user that builds the packages to the owner of the GPG home.
decman.config.makepkg_user = "thadryan"
