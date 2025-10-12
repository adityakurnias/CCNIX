{ pkgs, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/https" = "app.zen_browser.zen.desktop";

    "text/html" = "app.zen_browser.zen.desktop";
  };

  home.sessionVariables = {
    BROWSER = "zen";
    DEFAULT_BROWSER = "zen";
  };
}
