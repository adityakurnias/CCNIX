{ pkgs, ... }:

{
  xdg.mime.enable = true;

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http"  = "app.zen_browser.zen.desktop";
    "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
    "text/html"              = "app.zen_browser.zen.desktop";
  };
  
  home.sessionVariables = {
    BROWSER = "flatpak run app.zen_browser.zen";
    DEFAULT_BROWSER = "flatpak run app.zen_browser.zen";
  };
}
