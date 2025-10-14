{ pkgs, ... }:

{
  xdg.mime.enable = true;
  xdg.mimeApps ={
    enable = true;
    defaultApplications = {
      "text/html"              = "app.zen_browser.zen.desktop";
      "x-scheme-handler/http"  = "app.zen_browser.zen.desktop";
      "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/default-applications/web" = {
      "browser" = "app.zen_browser.zen.desktop";
    };
  };

  home.sessionVariables = {
    BROWSER = "app.zen_browser.zen";
    DEFAULT_BROWSER = "app.zen_browser.zen";
    XDG_DATA_DIRS = "/var/lib/flatpak/exports/share";
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    xdgOpenUsePortal = true;
  };
}
