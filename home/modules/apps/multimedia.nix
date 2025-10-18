{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    obs-studio
    gimp
    krita
  ];
}
