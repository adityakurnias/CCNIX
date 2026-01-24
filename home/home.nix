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
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
    inputs.dankMaterialShell.homeModules.niri
    inputs.niri.homeModules.niri
    inputs.zen-browser.homeModules.beta

    ./modules
  ];

  programs.dank-material-shell = {
    enable = true;
    niri = {
      includes.enable = true;
      enableSpawn = true; # Auto-start DMS with niri, if enabled
    };

    dgop.package = inputs.dgop.packages.${pkgs.system}.default;

    quickshell.package = pkgs.quickshell;
  };

}
