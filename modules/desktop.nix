{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
  
  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = false;
}

