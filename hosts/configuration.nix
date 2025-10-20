{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../fw/firmware.nix
    # System modules (modularized)
    ../modules/environment.nix
    ../modules/users.nix
    ../modules/programs.nix
    ../modules/services.nix
    ../modules/hardware.nix
    ../modules/boot.nix
    ../modules/nix.nix
    ../modules/networking.nix
    ../modules/locales.nix
    ../modules/desktop.nix
    ../modules/audio.nix
    ../modules/printing.nix
    ../modules/flatpak.nix
    ../modules/nixpkgs.nix
    ../modules/state.nix
  ];

  # services.gnome.gnome-keyring.enable = true;
}
