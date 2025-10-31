{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    adw-gtk3
    bibata-cursors
  ];
  
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
