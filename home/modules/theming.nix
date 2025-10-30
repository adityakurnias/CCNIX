{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    bibata-cursors
  ];
  
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
