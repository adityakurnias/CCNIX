{
  inputs,
  ...
}:

{
  home.username = "kurnias";
  home.homeDirectory = "/home/kurnias";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
    inputs.niri.homeModules.niri
    inputs.zen-browser.homeModules.beta

    # Modules
    ./modules/shell.nix
    ./modules/fonts.nix
    ./modules/packages.nix
    ./modules/dev.nix
    ./modules/theming.nix
    ./modules/apps.nix
    ./modules/games.nix
    ./modules/xdg.nix
    ./modules/dev/lamp.nix
  ];

  programs.dankMaterialShell = {
    enable = true;
    
    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dankMaterialShell changes
    };
  };
}
