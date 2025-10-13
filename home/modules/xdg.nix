# Pastikan 'lib' ada di sini
{ pkgs, config, lib, ... }:

{
  xdg.mime.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html"              = "app.zen_browser.zen.desktop";
    "x-scheme-handler/http"  = "app.zen_browser.zen.desktop";
    "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
  };

  dconf.settings = {
    "org/gnome/desktop/default-applications/web" = {
      "browser" = "app.zen_browser.zen.desktop";
    };
  };

  home.sessionVariables = {
    BROWSER = "flatpak run app.zen_browser.zen";
    DEFAULT_BROWSER = "flatpak run app.zen_browser.zen";
    # Gunakan fungsi ini untuk mengubah list menjadi string
    # XDG_DATA_DIRS = lib.strings.concatStringsSep ":" [
    #   # Menambahkan path Flatpak ke depan
    #   "${config.home.homeDirectory}/.local/share/flatpak/exports/share"
    #   "/var/lib/flatpak/exports/share"
    #   # Path default sistem
    #   "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
    #   "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    #   "/run/current-system/sw/share"
    # ];
    XDG_DATA_DIRS = "/var/lib/flatpak/exports/share";
  };
}