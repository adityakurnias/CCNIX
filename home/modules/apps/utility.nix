{ pkgs, ... }:

{
  home.packages = with pkgs; [
    localsend
    scrcpy
    nautilus
    # waydroid => moved to /modules/programs.nix
    
    # Wine 
    wineWowPackages.staging
    winetricks
    bottles
    kdePackages.dolphin
  ];
}
