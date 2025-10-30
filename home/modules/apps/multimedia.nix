{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    gimp
    krita
    aseprite
  ];
}
