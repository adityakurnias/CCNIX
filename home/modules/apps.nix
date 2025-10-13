{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Internet
    # firefox
    thunderbird
    vesktop

    # Utility
    localsend

    # Multimedia
    vlc
    obs-studio
    gimp
    krita
    # aseprite

    # Productivity
    libreoffice-fresh
    obsidian
  ];
}