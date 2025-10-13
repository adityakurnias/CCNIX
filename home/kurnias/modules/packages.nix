{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System Utility
    brightnessctl
    cliphist
    wl-clipboard
    #Audio
    pwvucontrol
    pavucontrol
    alsa-utils
    alsa-tools

    # Theming
    cava
    gnome-themes-extra
    gtk-engine-murrine
    matugen

    # Others
    sassc
    fastfetch

    # CLI
    eza
    bat
    fastfetch
  ];
}
