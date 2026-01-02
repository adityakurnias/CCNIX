{
  pkgs,
  ...
}:
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
      browser = "zen-beta";
    };
  };

  home.sessionVariables = {
    BROWSER = "zen-beta";
    DEFAULT_BROWSER = "zen-beta";
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  
    config.common.default = [
      "gtk"
    ];
  };

}
