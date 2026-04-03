{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop
    discord
    google-chrome
    firefox
  ];
  
  programs.zen-browser.enable = true;
}
