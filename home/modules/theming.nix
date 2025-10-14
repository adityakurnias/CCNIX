{ pkgs, ... }:

{

  home.packages = with pkgs; [
    qt6ct
    bibata-cursors
  ];

  home.pointerCursor = with pkgs; {
    package = bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 12;
    gtk.enable = true;
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
