{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.programs.niri or {};
in
{
  xdg.mime.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
    };
  };

  xdg.configFile."mimeapps.list".force = true;

  dconf.settings = {
    "org/gnome/desktop/default-applications/web" = {
    browser = "zen-beta.desktop";
    };
  };

  home.sessionVariables = {
    BROWSER = "zen-beta";
    DEFAULT_BROWSER = "zen-beta";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];

    config = {
      common.default = [ "gtk" ];

      niri = {
        default = [
          "gtk"
          "gnome"
        ];
        "org.freedesktop.impl.portal.Access" = "gnome";
        "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
        "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
      };
    };
  };
}
