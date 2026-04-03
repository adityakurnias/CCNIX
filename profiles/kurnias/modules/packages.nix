{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System Utility
    brightnessctl
    cliphist
    wl-clipboard
    pwvucontrol
    alsa-utils
    alsa-tools

    # Theming
    cava
    gnome-themes-extra
    gtk-engine-murrine
    matugen

    # Others
    sassc
    gnome-tweaks
    fuzzel

    # CLI Tool
    eza # ls alternative
    bat # cat alternative
    zoxide # cd alternative
    fastfetch 
    tree # ls with tree
    btop # task manager
  ];
}
