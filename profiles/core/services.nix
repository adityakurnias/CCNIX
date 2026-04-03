{ config, lib, pkgs, ... }:

let
  cfg = config.ccnix.services;
in {
  options.ccnix.services = {
    enableDesktopServices = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enables desktop auxiliary services like gvfs, flatpak, upower, and polkit.";
    };
  };

  config = lib.mkIf cfg.enableDesktopServices {
    security.polkit.enable = lib.mkDefault true;
    services.gnome.gnome-keyring.enable = lib.mkDefault true;
    services.flatpak.enable = lib.mkDefault true;
    services.printing.enable = lib.mkDefault false;
    services.gvfs.enable = lib.mkDefault true;
    services.upower.enable = lib.mkDefault true;
    services.earlyoom.enable = lib.mkDefault true;
  };
}
