{ pkgs, ... }:

{
  home.packages = with pkgs; [
    localsend
    
    wineWowPackages.staging
    winetricks
    bottles
  ];
}
