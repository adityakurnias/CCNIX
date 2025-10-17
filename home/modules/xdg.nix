{
  pkgs,
  config,
  lib,
  ...
}:

{
  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "app.zen_browser.zen.desktop";
      "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
      "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/default-applications/web" = {
      "browser" = "app.zen_browser.zen.desktop";
    };
  };

  # HAPUS ATAU KOMENTARI BLOK DI BAWAH INI
  # home.sessionVariables = {
  #   BROWSER = "app.zen_browser.zen";
  #   DEFAULT_BROWSER = "app.zen_browser.zen";
  #   XDG_DATA_DIRS = "${pkgs.lib.mkForce "${
  #     config.home.sessionVariables.XDG_DATA_DIRS or ""
  #   }:/usr/share:/usr/local/share:/var/lib/flatpak/exports/share:${config.home.homeDirectory}/.local/share"}";
  # };

  # CUKUP SISAKAN INI JIKA MASIH DIPERLUKAN
  home.sessionVariables = {
    BROWSER = "app.zen_browser.zen";
    DEFAULT_BROWSER = "app.zen_browser.zen";
  };


  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    xdgOpenUsePortal = true;

    config.common.default = "*";
  };
}