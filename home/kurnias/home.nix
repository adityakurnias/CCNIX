{ config, pkgs, dankMaterialShell, niri, ... }:
{
  home.username = "kurnias";
  home.homeDirectory = "/home/kurnias";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  imports = [
    dankMaterialShell.homeModules.dankMaterialShell.default
    dankMaterialShell.homeModules.dankMaterialShell.niri

    # Modules
    ./modules/shell.nix
    ./modules/fonts.nix
    ./modules/packages.nix
    ./modules/dev.nix
    ./modules/theming.nix
    ./modules/apps.nix
    ./modules/games.nix
    ./modules/xdg.nix
    ./modules/apps/discord.nix
  ];

  programs.dankMaterialShell.enable = true;
}
