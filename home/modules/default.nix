{ ... }:

{
  imports = [
    ./shell.nix
    ./fonts.nix
    ./packages.nix
    ./dev.nix
    ./theming.nix
    ./apps.nix
    ./games.nix
    ./xdg.nix
    ./dev/lamp.nix
    ./apps
  ];
}