{ config, pkgs, lib, ... }:

{
  xdg.portal = {
    enable = true;
    
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];

    config = {
      common.default = [ "gtk" ];
      
      niri = lib.mkForce{
        default = [ "gtk" "gnome" ];
        "org.freedesktop.impl.portal.Access" = [ "gnome" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };
}