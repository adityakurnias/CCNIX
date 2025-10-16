{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System Utility
    brightnessctl
    cliphist
    wl-clipboard
    pwvucontrol
    pavucontrol
    alsa-utils
    alsa-tools

    # Theming
    cava
    gnome-themes-extra
    gtk-engine-murrine
    matugen
    fuzzel

    # Others
    sassc
    gnome-tweaks

    # CLI Tool
    eza
    bat
    zoxide
    fastfetch
    tree
    btop
  ];
}
