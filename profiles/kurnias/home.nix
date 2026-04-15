{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  home.username = "kurnias";
  home.homeDirectory = "/home/kurnias";
  home.stateVersion = "23.11";

  # Advanced Modules
  ccnix.userProfile.packages.enableThemingTools = true;
  ccnix.userProfile.packages.enableSystemUtilities = true;
  ccnix.userProfile.packages.enableAudioTools = true;
  ccnix.userProfile.devTools.enable = true;
  ccnix.userProfile.fonts.enable = true;
  ccnix.userProfile.games.enable = true;
  ccnix.userProfile.apps.internet.enable = true;
  ccnix.userProfile.apps.multimedia.enable = true;
  ccnix.userProfile.apps.productivity.enable = true;
  ccnix.userProfile.apps.utility.enable = true;

  programs.home-manager.enable = true;

  imports = [
    inputs.niri.homeModules.niri
    inputs.zen-browser.homeModules.beta

    ./modules
  ];

  ccnix.userProfile.desktop.shell = "noctalia-shell"; # Switch between "dank-material-shell" and "noctalia-shell"




}
