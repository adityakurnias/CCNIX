{ ... }:

{
  imports = [
    ./shell.nix
    ./fonts.nix
    ./packages.nix
    ./dev.nix
    ./theming.nix
    ./xdg.nix
    ./dev/lamp.nix
    ./apps
  ];
}