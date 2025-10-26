{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qt6ct
    bibata-cursors
  ];
  
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
