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
      includes.enable = false;
    };
    
    systemd = {
       enable = true;             # Systemd service for auto-start
       restartIfChanged = true;   # Auto-restart dms.service when dank-material-shell changes
     };

    dgop.package = inputs.dgop.packages.${pkgs.system}.default;

    quickshell.package = pkgs.quickshell;
  };

}
