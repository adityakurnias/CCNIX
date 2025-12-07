{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop
    legcord
    discord-ptb
    google-chrome
  ];
  
  programs.zen-browser.enable = true;
}
