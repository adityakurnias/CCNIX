{ pkgs, ... }:

{
  home.packages = with pkgs; [
    localsend
    
    # Wine 
    wineWowPackages.staging
    winetricks
    bottles
  ];
}
