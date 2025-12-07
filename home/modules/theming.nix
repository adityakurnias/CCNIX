{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    adw-gtk3
    adwaita-qt
  ];
  
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
  
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
}
