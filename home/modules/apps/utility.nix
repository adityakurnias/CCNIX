{ pkgs, ... }:

{
  home.packages = with pkgs; [
    localsend
    scrcpy
    
    # Wine 
    wineWowPackages.staging
    winetricks
    bottles
    kdePackages.dolphin
  ];
}
