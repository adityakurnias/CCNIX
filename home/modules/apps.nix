{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    # Internet
    thunderbird
    vesktop

    # Utility
    localsend

    # Multimedia
    vlc
    obs-studio
    gimp
    krita

    # Productivity
    libreoffice-fresh
    obsidian
  ];
}
