{ config, lib, pkgs, ... }:
let
  cfg = config.ccnix.desktop;
in {
  options.ccnix.desktop = {
    enable = lib.mkEnableOption "Enable Desktop configuration";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "modesetting" ];
    
    services.displayManager.gdm.enable = false;
    services.desktopManager.gnome.enable = false;
  };
}
