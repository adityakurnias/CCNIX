{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop
    legcord
    discord
  ];
}
