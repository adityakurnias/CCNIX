{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    gimp
    krita
    aseprite
  ];
  
  nixpkgs.overlays = [
    (final: prev: {
      aseprite = prev.aseprite.override {
        skia = prev.skia;
      };
    })
  ];
}
