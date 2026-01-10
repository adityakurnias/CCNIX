{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop
    discord
    google-chrome
  ];
  
  programs.zen-browser.enable = true;
}
